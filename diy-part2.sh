#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

#修正连接数
sed -i '/customized in this file/a net.netfilter.nf_conntrack_max=165535' package/base-files/files/etc/sysctl.conf

# Add theme
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd

# Modify hostname
sed -i 's/OpenWrt/OCD_AP/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /OCD build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

#添加额外非必须软件包
git clone https://github.com/vernesong/OpenClash.git package/OpenClash