import os
import subprocess

if __name__ == "__main__":
    print("[lint.py] Linting")
    dir_path = os.path.dirname(os.path.realpath(__file__))
    print(f"[lint.py] Root Directory: {dir_path}")
    for subdir, dirs, files in os.walk(dir_path):
        for file in files:
            #print os.path.join(subdir, file)
            filepath = subdir + os.sep + file
            if filepath.endswith(".sh"):
                print(f"[lint.py] Linting {filepath}")
                subprocess.run(["shellcheck", filepath])
