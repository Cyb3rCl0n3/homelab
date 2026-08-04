import subprocess
import tempfile
import pathlib

with tempfile.TemporaryDirectory() as tmpdir:
    key_path = pathlib.Path(tmpdir) / "id_rsa"

    subprocess.run(
        ["ssh-keygen", "-t", "rsa", "-b", "4096", "-N", "", "-f", str(key_path)],
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    public_key = (key_path.with_suffix(".pub")).read_text(encoding="utf-8").strip()

    terraform =\
f'''resource "detection_canary" "private_key" {{
  key = "{public_key}"
}}
'''
    with open("tests/fixtures/private_key.tf", "w", encoding="utf-8") as f:
        f.write(terraform)
