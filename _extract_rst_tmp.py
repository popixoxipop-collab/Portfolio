import numpy as np
from ansys.mapdl import reader as pymapdl_reader

base = r"C:\Users\ALIENWARE-R13\Portfolio\04_재료역학_기계요소\ANSYS_구조해석\프로젝트 파일"
files = {
    "SPRING":   base + r"\SPRING_files\dp0\SYS\MECH\file.rst",
    "ansys01":  base + r"\ansys01_files\dp0\SYS\MECH\file.rst",
    "HW2":      base + r"\HW2_files\dp0\SYS\MECH\file.rst",
    "222_SYS":  base + r"\222_files\dp0\SYS\MECH\file.rst",
    "222_SYS-1":base + r"\222_files\dp0\SYS-1\MECH\file.rst",
}

for name, path in files.items():
    print("="*70)
    print("FILE:", name)
    print("PATH:", path)
    try:
        rst = pymapdl_reader.read_binary(path)
        nsets = rst.nsets
        print("result_sets (nsets):", nsets)
        idx = nsets - 1  # last result set
        # displacement
        try:
            nnum, disp = rst.nodal_displacement(idx)
            dmag = np.linalg.norm(disp[:, :3], axis=1)
            max_disp = np.nanmax(dmag)
        except Exception as e:
            max_disp = None
            print("  disp error:", repr(e))
        # stress
        try:
            nnum_s, stress = rst.nodal_stress(idx)
            sx, sy, sz, sxy, syz, sxz = [stress[:, i] for i in range(6)]
            vm = np.sqrt(0.5*((sx-sy)**2+(sy-sz)**2+(sz-sx)**2)+3*(sxy**2+syz**2+sxz**2))
            max_vm = np.nanmax(vm)
        except Exception as e:
            max_vm = None
            print("  stress error:", repr(e))
        print("RESULT set idx used:", idx)
        print("  max_von_Mises:", max_vm)
        print("  max_disp:", max_disp)
    except Exception as e:
        print("  OPEN/READ ERROR:", repr(e))
