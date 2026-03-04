# BIOL550 Python environment (one environment for the course)

Use this **single** environment for BIOL550 notebooks/scripts:

- Env path: `Semester5/BIOL550/biol550_env/`
- Jupyter kernel name: `BIOL550 (biol550_env)`

## Activate (terminal)

```bash
cd /Users/pitergarcia/DataScience
source Semester5/BIOL550/biol550_env/bin/activate
python -V
```

## Launch JupyterLab

```bash
cd /Users/pitergarcia/DataScience
source Semester5/BIOL550/biol550_env/bin/activate
jupyter lab
```

Then in the notebook UI: **Kernel → Change Kernel → BIOL550 (biol550_env)**.

## Install more packages (if needed)

```bash
cd /Users/pitergarcia/DataScience
source Semester5/BIOL550/biol550_env/bin/activate
python -m pip install <package>
```

## Cleanup note

An old mistaken venv was moved to `_DELETE_me_old_dotvenv_*` for safety; you can delete that folder later.
