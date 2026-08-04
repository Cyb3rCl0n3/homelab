import subprocess
import tempfile
import pathlib

output = pathlib.Path(__file__).parent / "private_key.tf"

with tempfile.TemporaryDirectory() as tmpdir:
    key_path = pathlib.Path(tmpdir) / "id_rsa"

    subprocess.run(
        ["ssh-keygen", "-t", "rsa", "-b", "4096", "-N", "", "-f", str(key_path)],
        check=True,
        stdout=subprocess.DEVNULL,
        stderr=subprocess.DEVNULL,
    )

    # The PRIVATE half is what the scanners match on; id_rsa.pub is meant to be
    # published and fires nothing. A multi-line PEM needs a heredoc, not a
    # quoted HCL string.
    private_key = key_path.read_text(encoding="utf-8").strip()

    terraform =\
f'''resource "detection_canary" "private_key" {{
  key = <<EOT
{private_key}
EOT
}}
'''
    output.write_text(terraform, encoding="utf-8")
