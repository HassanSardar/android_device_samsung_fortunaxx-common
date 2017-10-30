#!/system/bin/sh
# Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

target=`getprop ro.board.platform`

case "$target" in
    "msm8916")
        # Change PM debug parameters permission
        chown -h radio.system /sys/module/qpnp_power_on/parameters/reset_enabled
        chown -h radio.system /sys/module/qpnp_power_on/parameters/wake_enabled
        chown -h radio.system /sys/module/qpnp_int/parameters/debug_mask
        chown -h radio.system /sys/module/lpm_levels/parameters/secdebug
        chmod -h 664 /sys/module/qpnp_power_on/parameters/reset_enabled
        chmod -h 664 /sys/module/qpnp_power_on/parameters/wake_enabled
        chmod -h 664 /sys/module/qpnp_int/parameters/debug_mask
        chmod -h 664 /sys/module/lpm_levels/parameters/secdebug
        chmod -h 444 /sys/kernel/wakeup_reasons/last_resume_reason

        if [ -f /sys/devices/soc0/soc_id ]; then
            soc_id=`cat /sys/devices/soc0/soc_id`
        else
            soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case "$soc_id" in
            "206" | "247" | "248" | "249" | "250")
            echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled
            echo 1 > /sys/devices/system/cpu/cpu1/online
            echo 1 > /sys/devices/system/cpu/cpu2/online
            echo 1 > /sys/devices/system/cpu/cpu3/online
            ;;
            "239" | "241" | "263" | "268" | "269" | "270" | "271")
            echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled
            echo 10 > /sys/class/net/rmnet0/queues/rx-0/rps_cpus
            ;;
            "233" | "240" | "242")
            echo 0 > /sys/module/lpm_levels/parameters/sleep_disabled
            echo 1 > /sys/devices/system/cpu/cpu1/online
            echo 1 > /sys/devices/system/cpu/cpu2/online
            echo 1 > /sys/devices/system/cpu/cpu3/online
       ;;
       esac
    ;;
esac

case "$target" in
    "msm8916")

        if [ -f /sys/devices/soc0/soc_id ]; then
           soc_id=`cat /sys/devices/soc0/soc_id`
        else
           soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi

        # HMP scheduler settings for 8916, 8936, 8939, 8929
        echo 3 > /proc/sys/kernel/sched_window_stats_policy

        # Apply governor settings for 8916
        case "$soc_id" in
            "206" | "247" | "248" | "249" | "250")

                # HMP scheduler load tracking settings
                echo 3 > /proc/sys/kernel/sched_ravg_hist_size

                # HMP Task packing settings for 8916
                echo 50 > /proc/sys/kernel/sched_small_task
                echo 50 > /proc/sys/kernel/sched_mostly_idle_load
                echo 10 > /proc/sys/kernel/sched_mostly_idle_nr_run

                # disable thermal core_control to update scaling_min_freq
                echo 0 > /sys/module/msm_thermal/core_control/enabled
                echo 1 > /sys/devices/system/cpu/cpu0/online
                echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                echo 200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
                # enable thermal core_control now
                echo 1 > /sys/module/msm_thermal/core_control/enabled

                echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/target_loads
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                chown -h system.system /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                chown -h system.system /sys/class/devfreq/0.qcom,cpubw/min_freq
                chown -h system.system /sys/class/devfreq/0.qcom,cpubw/max_freq
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/target_loads
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                chmod -h 0660 /sys/devices/system/cpu/cpufreq/interactive/sampling_down_factor
                chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/min_freq
                chmod -h 0660 /sys/class/devfreq/0.qcom,cpubw/max_freq

                echo "25000 1094400:50000" > /sys/devices/system/cpu/cpufreq/interactive/above_hispeed_delay
                echo 90 > /sys/devices/system/cpu/cpufreq/interactive/go_hispeed_load
                echo 25000 > /sys/devices/system/cpu/cpufreq/interactive/timer_rate
                echo 998400 > /sys/devices/system/cpu/cpufreq/interactive/hispeed_freq
                echo 0 > /sys/devices/system/cpu/cpufreq/interactive/io_is_busy
                echo "1 200000:40 400000:50 533333:70 800000:82 998400:90 1094400:95 1209600:99" > /sys/devices/system/cpu/cpufreq/interactive/target_loads
                echo 50000 > /sys/devices/system/cpu/cpufreq/interactive/min_sample_time
                echo 50000 > /sys/devices/system/cpu/cpufreq/interactive/max_freq_hysteresis
                echo 200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq

                # Bring up all cores online
                echo 1 > /sys/devices/system/cpu/cpu1/online
                echo 1 > /sys/devices/system/cpu/cpu2/online
                echo 1 > /sys/devices/system/cpu/cpu3/online
                echo 1 > /sys/devices/system/cpu/cpu4/online
            ;;
        esac
    ;;
esac

chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
chown -h system /sys/devices/system/cpu/cpufreq/ondemand/io_is_busy

emmc_boot=`getprop ro.boot.emmc`
case "$emmc_boot"
    in "true")
        chown -h system /sys/devices/platform/rs300000a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300000a7.65536/sync_sts
        chown -h system /sys/devices/platform/rs300100a7.65536/force_sync
        chown -h system /sys/devices/platform/rs300100a7.65536/sync_sts
    ;;
esac

# Post-setup services
case "$target" in
    "msm8916")
        if [ -f /sys/devices/soc0/soc_id ]; then
           soc_id=`cat /sys/devices/soc0/soc_id`
        else
           soc_id=`cat /sys/devices/system/soc/soc0/id`
        fi
        case $soc_id in
        "239" | "241" | "263" | "268" | "269" | "270" | "271")
            setprop ro.min_freq_0 533333
            setprop ro.min_freq_4 499200
        ;;
        "206" | "247" | "248" | "249" | "250" | "233" | "240" | "242")
            setprop ro.min_freq_0 533333
        ;;
        esac
        #start perfd after setprop
        start perfd # start perfd on 8916, 8939 and 8929
    ;;
esac

case "$target" in
    "msm8916")
        # Let kernel know our image version/variant/crm_version
        image_version="10:"
        image_version+=`getprop ro.build.id`
        image_version+=":"
        image_version+=`getprop ro.build.version.incremental`
        image_variant=`getprop ro.product.name`
        image_variant+="-"
        image_variant+=`getprop ro.build.type`
        oem_version=`getprop ro.build.version.codename`
        echo 10 > /sys/devices/soc0/select_image
        echo $image_version > /sys/devices/soc0/image_version
        echo $image_variant > /sys/devices/soc0/image_variant
        echo $oem_version > /sys/devices/soc0/image_crm_version
        ;;
esac

# Create native cgroup and move all tasks to it. Allot 15% real-time
# bandwidth limit to native cgroup (which is what remains after
# Android uses up 80% real-time bandwidth limit). root cgroup should
# become empty after all tasks are moved to native cgroup.

CGROUP_ROOT=/dev/cpuctl
mkdir $CGROUP_ROOT/native
echo 150000 > $CGROUP_ROOT/native/cpu.rt_runtime_us

# We could be racing with task creation, as a result of which its possible that
# we may fail to move all tasks from root cgroup to native cgroup in one shot.
# Retry few times before giving up.

for loop_count in 1 2 3
do
	for i in $(cat $CGROUP_ROOT/tasks)
	do
		echo $i > $CGROUP_ROOT/native/tasks
	done

	root_tasks=$(cat $CGROUP_ROOT/tasks)
	if [ -z "$root_tasks" ]
	then
		break
	fi
done

# Check if we failed to move all tasks from root cgroup
if [ ! -z "$root_tasks" ]
then
	echo "Error: Could not move all tasks to native cgroup"
fi
