file_loc="/mnt/c/Program Files (x86)/Steam/config/"
cd "$file_loc"
cp steamvr.vrsettings steamvr.vrsettings.old

echo "Select 1 to Change Multipler, 2 to Toggle Grip Setting"
read choice
case "$choice" in
	"1")
	cur_val=$(jq '.steamvr.renderTargetMultiplier' steamvr.vrsettings) 
	echo "Current render multiplier is $cur_val"
	echo "Enter a new render multiplier Value: "
	read value
	jq .steamvr.renderTargetMultiplier=$value steamvr.vrsettings | ex -sc 'wq!steamvr.vrsettings' /dev/stdin	
	;;

	"2")
	cur_val=$(jq '.revive.ToggleGrip' steamvr.vrsettings)	
	echo "Toggle Grip is Currently: $cur_val"
	sleep 1
	if [ $cur_val == "true" ]
	then
	echo "Setting Toggle Grip to False"
	jq .revive.ToggleGrip=false steamvr.vrsettings | ex -sc 'wq!steamvr.vrsettings' /dev/stdin	
	else
	echo "Setting Toggle Grip to True"
	jq .revive.ToggleGrip=true steamvr.vrsettings | ex -sc 'wq!steamvr.vrsettings' /dev/stdin	
	fi
	;;
esac	
