{
  pkgs,
  inputs,
  ...
}: {
  services.yabai = {
    enable = true;
    config = {
      external_bar = "off:40:0";
      menubar_opacity = "1.0";
      mouse_follows_focus = "off";
      focus_follows_mouse = "off";
      display_arrangement_order = "default";
      window_origin_display = "default";
      window_placement = "second_child";
      window_insertion_point = "focused";
      window_zoom_persist = "on";
      window_shadow = "on";
      window_animation_duration = "0.0";
      window_animation_easing = "ease_out_circ";
      window_opacity_duration = "0.0";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.90";
      window_opacity = "off";
      insert_feedback_color = "0xffd75f5f";
      split_ratio = "0.50";
      split_type = "auto";
      auto_balance = "off";
      top_padding = 8;
      bottom_padding = 48;
      left_padding = 8;
      right_padding = 8;
      window_gap = 6;
      layout = "bsp";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
    };
    # extraConfig = builtins.readFile ./conf/yabairc;
    extraConfig = let
      disableApps = [
        "系统设置"
        "微信"
        "QQ"
        "网易云音乐"
        "哔哩哔哩"
      ];
    in ''
      yabai -m rule --add app='^(${pkgs.lib.concatStringsSep "|" disableApps})$' manage=off
      # yabai -m rule --add app='^.*$' space=1 manage=off
    '';
  };

  services.jankyborders = {
    enable = true;
    style = "round";
    width = 5.0;
    hidpi = true;
    inactive_color = "0xff222436";
    active_color = "0xff82aaff";
  };
}
