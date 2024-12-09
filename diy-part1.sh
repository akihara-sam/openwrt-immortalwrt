#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git passwall_pk https://github.com/xiaorouji/openwrt-passwall-packages.git' >>feeds.conf.default
echo 'src-git passwall_app https://github.com/xiaorouji/openwrt-passwall.git' >>feeds.conf.default
echo 'src-git helloworld https://github.com/fw876/helloworld.git' >>feeds.conf.default
echo 'src-git poweroff https://github.com/akihara-sam/luci-app-poweroff.git' >>feeds.conf.default
# echo 'src-git luci_app_autoreboot https://github.com/akihara-sam/luci-app-autoreboot.git' >>feeds.conf.default
# echo 'src-git openclash https://github.com/vernesong/OpenClash.git' >>feeds.conf.default
