{ pkgs, settings, ... }: 
{
  services.hypridle = {
		enable = true;
		settings.general.before_sleep_cmd = "pid hyprlock || hyprlock --immediate";
		settings.general.after_sleep_cmd = "hyprctl dispatch dpms on";
		settings.listener = [
			{
				timeout = 300;
				on-timeout = "brightnessctl -s set 3";
				on-resume = "brightnessctl -r";
			}
			{
				timeout = 420;
				on-timeout = "pid hyprlock || hyprlock || cw";
			}
			{
				timeout = 450;
				on-timeout = "hyprctl dispatch dpms off";
				on-resume = "hyprctl dispatch dpms on";
			}
			{
				timeout = 1000;
				on-timeout = "pid hyprlock || hyprlock --immediate & systemctl suspend";
			}
  	];
  };
}
