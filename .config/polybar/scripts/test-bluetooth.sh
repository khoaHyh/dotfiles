bluetooth_print() {
	if bluetoothctl show | grep -q "Powered: no"; then
		bluetoothctl power on >> /dev/null
		sleep 1
}
