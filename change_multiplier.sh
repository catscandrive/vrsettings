file_loc="/mnt/c/Program Files (x86)/Steam/config/"
cd "$file_loc"
mult=$(jq .steamvr.renderTargetMultiplier steamvr.vrsettings)
echo "Current Multiplier is :" $mult
grip=$(jq .revive.ToggleGrip steamvr.vrsettings)
echo "Current Toggle Grip setting is :" $grip



echo "Select 1 to Change Multipler, 2 to Toggle Grip Setting, Any other key to exit"
read choice
case "$choice" in
	"1")
	cp steamvr.vrsettings steamvr.vrsettings.old
	echo "Enter a new render multiplier Value: "
	read value
	jq .steamvr.renderTargetMultiplier=$value steamvr.vrsettings | ex -sc 'wq!steamvr.vrsettings' /dev/stdin	
	;;

	"2")
	cp steamvr.vrsettings steamvr.vrsettings.old
	if [ $grip == "true" ]
	then
	echo "Setting Toggle Grip to False"
	jq .revive.ToggleGrip=false steamvr.vrsettings | ex -sc 'wq!steamvr.vrsettings' /dev/stdin	
	else
	echo "Setting Toggle Grip to True"
	jq .revive.ToggleGrip=true steamvr.vrsettings | ex -sc 'wq!steamvr.vrsettings' /dev/stdin	
	fi
	;;

	*)
	exit
	;;
esac	
