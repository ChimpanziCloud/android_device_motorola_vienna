#!/system/bin/sh

SYSFS_NODE=/sys/class/flashlight_core/flashlight/flashlight_torch
VIRTUAL_TORCH_DIR=/tmp/of_torch
CONTROL_NODE=$VIRTUAL_TORCH_DIR/brightness
PREVIOUS_VAL=-1

rm -rf $VIRTUAL_TORCH_DIR
mkdir -p $VIRTUAL_TORCH_DIR
echo 0 > $CONTROL_NODE

chmod 666 $CONTROL_NODE
echo 1 > $VIRTUAL_TORCH_DIR/max_brightness

while usleep 100000; do
    CURRENT_VAL=$(cat $CONTROL_NODE)

    [ -z "$CURRENT_VAL" ] || [ "$CURRENT_VAL" = "$PREVIOUS_VAL" ] && continue
    PREVIOUS_VAL=$CURRENT_VAL

    if [ "$CURRENT_VAL" -eq 0 ]; then
        echo "0 0 0 0" > $SYSFS_NODE
    else
        echo "0 0 0 1" > $SYSFS_NODE
    fi
done
