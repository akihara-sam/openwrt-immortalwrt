#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.199.1/g' package/base-files/files/bin/config_generate

# 添加编译者信息到 99-default-settings-chinese
sed -i '/exit 0/i\
# 添加编译者信息\
build_info="Compiled by Akihara-Sam build $(TZ=UTC-8 date "+%Y.%m.%d")"\
uci -q get system.@imm_init[0].build_info > "/dev/null" || uci -q add system imm_init > "/dev/null"\
uci set system.@imm_init[0].build_info="$build_info"\
uci commit system\
echo -e "\nDISTRIB_DESCRIPTION=\"$build_info\"" >> /etc/openwrt_release\
echo "$build_info" >> /etc/banner
' package/emortal/default-settings/files/99-default-settings-chinese


# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


# 删除旧的 Go 语言包
# rm -rf ./feeds/packages/lang/golang

# 克隆指定版本的 Go 语言包
# git clone https://github.com/openwrt/packages.git -b master --single-branch --depth 1 temp_packages

# 仅复制golang目录
# cp -R temp_packages/lang/golang ./feeds/packages/lang/

# 清理临时文件
# rm -rf temp_packages
