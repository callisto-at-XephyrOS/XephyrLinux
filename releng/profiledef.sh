#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="XephyrOS"
iso_label="XephyrOS_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m)"
iso_publisher="XephyrOS Team"
iso_application="XephyrOS Live iSO"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.grub.esp' 'uefi-x64.grub.esp'
           'uefi-ia32.grub.eltorito' 'uefi-x64.grub.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'lz4' '-Xhc' '-b' '1M')
bootstrap_tarball_compression=(gzip -cn9)
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/etc/os-release"]="0:0:755"
  ["/root"]="0:0:750"
  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
)
