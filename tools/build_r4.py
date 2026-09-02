import sys,zipfile,re,hashlib,collections,os
from pathlib import Path
src=Path(sys.argv[1]); out=Path(sys.argv[2])
with zipfile.ZipFile(src,'r') as zin:
    names=zin.namelist(); lut={n.lower():n for n in names}; tex=zin.read('TEXTURES').decode('utf-8','replace'); iwad=zin.read('IWADINFO').decode('utf-8','replace')
block_re=re.compile(r'(?ms)^(\s*)(Texture|Flat|WallTexture|Sprite|Graphic)\s+"([^"]+)"\s*,\s*([0-9.]+)\s*,\s*([0-9.]+)\s*\{(.*?)^\s*\}')
blocks=list(block_re.finditer(tex))
if not blocks: raise SystemExit('No TEXTURES blocks parsed')
private={}; srcbytes={}; logical_tex=set(); logical_spr=set(); patch_sources=[]
for m in blocks:
 t,name,body=m.group(2),m.group(3),m.group(6)
 (logical_spr if t.lower()=='sprite' else logical_tex).add(name.lower())
 for pm in re.finditer(r'(?im)^\s*Patch\s+"([^"]+)"\s*,\s*([-+0-9.eE]+)\s*,\s*([-+0-9.eE]+)',body): patch_sources.append(pm.group(1))
for ps in patch_sources:
 if ps in private: continue
 actual=lut.get(ps.lower())
 if not actual: raise SystemExit('Missing patch source: '+ps)
 with zipfile.ZipFile(src,'r') as zin: srcbytes[ps]=zin.read(actual)
 stem=re.sub(r'[^A-Za-z0-9_.-]+','_',Path(ps).stem); ext=Path(ps).suffix.lower() or '.png'; h=hashlib.sha1(ps.encode()).hexdigest()[:10]
 private[ps]=f'patches/R4/{stem}_{h}{ext}'
rew=[]
for m in blocks:
 t,name,w,h,body=m.group(2),m.group(3),m.group(4),m.group(5),m.group(6)
 def rp(pm):
  ps=pm.group(1); x=float(pm.group(2)); y=float(pm.group(3))
  if t.lower()=='sprite': return f'    Patch "{private[ps]}", {int(round(x))}, {int(round(y))}'
  xi=int(round(x)) if abs(x-round(x))<1e-6 else x; yi=int(round(y)) if abs(y-round(y))<1e-6 else y
  return f'    Patch "{private[ps]}", {xi}, {yi}'
 b=re.sub(r'(?im)^\s*Patch\s+"([^"]+)"\s*,\s*([-+0-9.eE]+)\s*,\s*([-+0-9.eE]+)\s*$',rp,body)
 if t.lower()=='sprite':
  b=re.sub(r'(?im)^\s*Offset\s+([-+0-9.eE]+)\s*,\s*([-+0-9.eE]+)\s*$',lambda q:f'    Offset {int(round(float(q.group(1))))}, {int(round(float(q.group(2))))}',b)
 lines=[ln.rstrip() for ln in b.splitlines() if ln.strip()]
 rew.append(f'{t} "{name}", {w}, {h}\n{{\n'+'\n'.join(lines)+'\n}')
tex2='// R4 GenZD Texman-safe definitions\n\n'+'\n\n'.join(rew)+'\n'
remove=set()
for n in names:
 nl=n.lower(); st=Path(n).stem.lower(); ext=Path(n).suffix.lower()
 if ext in ('.png','.jpg','.jpeg','.tga','.pcx'):
  if nl.startswith('textures/') and st in logical_tex: remove.add(n)
  if nl.startswith('sprites/') and st in logical_spr: remove.add(n)
 if nl.startswith('r2patches/') or n=='R3_CRASHFIX_INFO.txt': remove.add(n)
iwad2=re.sub(r'(?im)^\s*StartupType\s*=\s*"Hexen"\s*$','    StartupType = "Doom"',iwad)
with zipfile.ZipFile(src,'r') as zin, zipfile.ZipFile(out,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=6) as zout:
 for zi in zin.infolist():
  n=zi.filename
  if n in remove or n in ('TEXTURES','IWADINFO'): continue
  zout.writestr(n,zin.read(n))
 for old,new in sorted(private.items(),key=lambda kv:kv[1].lower()): zout.writestr(new,srcbytes[old])
 zout.writestr('TEXTURES',tex2.encode()); zout.writestr('IWADINFO',iwad2.encode())
 zout.writestr('R4_TEXMAN_FIX_INFO.txt',b'R4 Texman compatibility pass: private composite patches, collision removal, integer sprite coordinates, StartupType Doom.\n')
with zipfile.ZipFile(out,'r') as z:
 bad=z.testzip(); ons=z.namelist(); lower=collections.Counter(n.lower() for n in ons); dups=[n for n,c in lower.items() if c>1]; txt=z.read('TEXTURES').decode('utf-8','replace'); refs=re.findall(r'(?im)^\s*Patch\s+"([^"]+)"',txt); onl={n.lower() for n in ons}; miss=[p for p in refs if p.lower() not in onl]
 if bad or dups or miss: raise SystemExit(f'Validation failed bad={bad} dups={len(dups)} miss={len(miss)}')
sha=hashlib.sha256(out.read_bytes()).hexdigest()
rep=out.with_name('GREZZODUE2_MOBILE_1TO1_FINAL_R4_VALIDATION.txt')
rep.write_text(f'R4 STATIC VALIDATION\nZIP entries: {len(ons)}\nCRC: OK\nCase-insensitive duplicates: 0\nMissing TEXTURES patch refs: 0\nSHA256: {sha}\nStatic validation: PASS\n')
print(sha)
