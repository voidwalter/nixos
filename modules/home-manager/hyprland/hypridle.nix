{ pkgs, settings, ... }: 
{
  services.hypridle = {
		enable = true;
		settings.general = {
			before_sleep_cmd = "pid hyprlock || hyprlock --immediate";
			after_sleep_cmd = "hyprctl dispatch dpms on";
		};
		settings.listener = [
			{
				timeout = 600;
				on-timeout = "brightnessctl -s set 3";
				on-resume = "brightnessctl -r";
			}
			{
				timeout = 630;
				on-timeout = "pid hyprlock || hyprlock || cw";
			}
			{
				timeout = 720;
				on-timeout = "hyprctl dispatch dpms off";
				on-resume = "hyprctl dispatch dpms on";
			}
			{
				timeout = 1200;
				on-timeout = "pid hyprlock || hyprlock --immediate & systemctl suspend";
			}
  	];
  };
}
