let
  plasma-manager = builtins.getFlake "github:nix-community/plasma-manager/a19a2a029fa180911bd89c554dca1616e10f4c1d";

  # plasma-manager пишет настройки в ~/.config.
  # Сам рабочий стол включается в system/desktop.nix.
  # Выбор эмодзи встроен в plasma-desktop, отдельного пакета нет.
  wallpaper = "file:///home/sd5th/Pictures/Wallpaper/Jellyfish.jpg";
  screen = "9fb6846b-e670-4116-a3b2-100cf7651c25";

  thirds = {
    layoutDirection = "horizontal";
    tiles = [
      { width = 0.25; }
      { width = 0.5; }
      { width = 0.25; }
    ];
  };
  work = {
    layoutDirection = "horizontal";
    tiles = [
      {
        layoutDirection = "vertical";
        width = 0.4;
        tiles = [
          { height = 0.5; }
          { height = 0.5; }
        ];
      }
      { width = 0.6; }
    ];
  };
  tiling = tiles: {
    padding = 4;
    tiles = builtins.toJSON tiles;
  };
in
{
  imports = [
    plasma-manager.homeModules.plasma-manager
  ];

  xdg.dataFile."applications/org.kde.plasma.emojier.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Emoji Selector
    NoDisplay=true
  '';

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      splashScreen.theme = "None";
      windowDecorations = {
        library = "org.kde.kwin.aurorae";
        theme = "kwin4_decoration_qml_plastik";
      };
    };

    kwin = {
      virtualDesktops = {
        rows = 1;
        names = [
          "Work"
          "Info"
          "Social"
        ];
      };
      edgeBarrier = 50;
      cornerBarrier = false;
      effects = {
        windowOpenClose.animation = "glide";
        shakeCursor.enable = false;
      };
    };

    input = {
      keyboard.layouts = [
        {
          layout = "us";
          variant = "";
          displayName = "";
        }
        {
          layout = "ru";
          variant = "";
          displayName = "";
        }
      ];
      touchpads = [
        {
          name = "AlpsPS/2 ALPS DualPoint TouchPad";
          vendorId = "2";
          productId = "8";
          naturalScroll = true;
          rightClickMethod = "twoFingers";
        }
      ];
    };

    powerdevil.AC = {
      dimDisplay.enable = false;
      displayBrightness = 100;
      powerProfile = "performance";
      powerButtonAction = "turnOffScreen";
      whenLaptopLidClosed = "turnOffScreen";
      autoSuspend.action = "nothing";
    };

    kscreenlocker.timeout = 10;

    panels = [
      {
        location = "bottom";
        height = 46;
        opacity = "opaque";
        widgets = [
          "org.kde.plasma.kickoff"
          {
            iconTasks = {
              launchers = [ ];
              behavior.middleClickAction = "close";
            };
          }
          "org.kde.plasma.marginsseparator"
          {
            systemTray.items.extra = [
              "org.kde.plasma.notifications"
              "org.kde.plasma.devicenotifier"
              "org.kde.plasma.manage-inputmethod"
              "org.kde.plasma.mediacontroller"
              "org.kde.plasma.cameraindicator"
              "org.kde.plasma.clipboard"
              "org.kde.plasma.volume"
              "org.kde.plasma.brightness"
              "org.kde.plasma.battery"
              "org.kde.plasma.keyboardindicator"
              "org.kde.kscreen"
              "org.kde.plasma.networkmanagement"
              "org.kde.plasma.keyboardlayout"
              "org.kde.plasma.weather"
            ];
          }
          {
            digitalClock = {
              date.enable = true;
              date.format.custom = "dd-MMM-yyyy";
              time.format = "24h";
              calendar.firstDayOfWeek = "monday";
              settings.Appearance = {
                autoFontAndSize = false;
                fontFamily = "Noto Sans";
                fontWeight = 400;
              };
            };
          }
        ];
      }
    ];

    startup.desktopScript.wallpaper = {
      priority = 3;
      text = ''
        let allDesktops = desktops();
        for (const desktop of allDesktops) {
            desktop.wallpaperPlugin = "org.kde.image";
            desktop.currentConfigGroup = ["Wallpaper", "org.kde.image", "General"];
            desktop.writeConfig("Image", "${wallpaper}");
        }
      '';
    };

    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Last-Used Keyboard Layout" = [ ];
        "Switch to Next Keyboard Layout" = "Alt+Shift";
      };
      "kaccess" = {
        "Toggle Screen Reader On and Off" = [ ];
      };
      "kmix" = {
        "decrease_microphone_volume" = [ ];
        "decrease_volume_small" = "Alt+Volume Down";
        "increase_microphone_volume" = [ ];
        "increase_volume_small" = "Alt+Volume Up";
        "mic_mute" = "Microphone Mute";
      };
      "ksmserver" = {
        "Lock Session" = "Meta+L";
      };
      "kwin" = {
        "Activate Window Demanding Attention" = [ ];
        "Expose" = [ ];
        "ExposeAll" = [ ];
        "ExposeClass" = [ ];
        "Grid View" = [ ];
        "Kill Window" = [ ];
        "MoveMouseToCenter" = [ ];
        "MoveMouseToFocus" = [ ];
        "Overview" = "Meta+Tab";
        "Switch One Desktop Down" = [ ];
        "Switch One Desktop Up" = [ ];
        "Switch Window Down" = [ ];
        "Switch Window Left" = [ ];
        "Switch Window Right" = [ ];
        "Switch Window Up" = [ ];
        "Switch to Desktop 1" = [ ];
        "Switch to Desktop 2" = [ ];
        "Switch to Desktop 3" = [ ];
        "Switch to Desktop 4" = [ ];
        "Walk Through Windows" = "Alt+Tab";
        "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "Walk Through Windows of Current Application" = [ ];
        "Walk Through Windows of Current Application (Reverse)" = [ ];
        "Window Close" = "Meta+Shift+Q";
        "Window Fullscreen" = "Meta+F";
        "Window Maximize" = "Meta+M";
        "Window Minimize" = "Meta+N";
        "Window One Desktop Down" = [ ];
        "Window One Desktop Up" = [ ];
        "Window One Desktop to the Left" = [ ];
        "Window One Desktop to the Right" = [ ];
        "Window Operations Menu" = [ ];
        "Window to Next Screen" = [ ];
        "Window to Previous Screen" = [ ];
        "disableInputCapture" = [ ];
      };
      "org_kde_powerdevil" = {
        "Decrease Keyboard Brightness" = [ ];
        "Decrease Screen Brightness Small" = "Alt+Monitor Brightness Down";
      };
      "plasmashell" = {
        "next activity" = "Meta+A";
        "previous activity" = "Meta+Shift+A";
      };
      "services/org.kde.konsole.desktop" = {
        "_launch" = "Meta+Return";
      };
      "services/org.kde.krunner.desktop" = {
        "RunClipboard" = [ ];
        "_launch" = "Alt+Space";
      };
      "services/org.kde.kscreen.desktop" = {
        "ShowOSD" = "Meta+P";
      };
      "services/org.kde.plasma-systemmonitor.desktop" = {
        "_launch" = "Ctrl+Shift+Esc";
      };
      "services/org.kde.plasma.emojier.desktop" = {
        "_launch" = [ ];
      };
      "services/org.kde.spectacle.desktop" = {
        "ActiveWindowScreenShot" = [ ];
        "FullScreenScreenShot" = "Ctrl+Print";
        "RecordRegion" = "Shift+Print";
        "RecordScreen" = "Ctrl+Shift+Print";
        "RecordWindow" = [ ];
        "RectangularRegionScreenShot" = "Print";
        "WindowUnderCursorScreenShot" = [ ];
        "_launch" = [ ];
      };
      "services/org.kde.touchpadshortcuts.desktop" = {
        "DisableTouchpad" = [ ];
        "EnableTouchpad" = [ ];
        "ToggleTouchpad" = [ ];
      };
      "services/systemsettings.desktop" = {
        "_launch" = [ ];
      };
    };

    configFile = {
      kwinrc = {
        MouseBindings = {
          CommandActiveTitlebar2 = "Close";
          CommandInactiveTitlebar2 = "Close";
        };
        Windows.ElectricBorderDelay = 125;
        Xwayland.Scale = 1.25;
        Plugins.windowapertureEnabled = false;
        "Tiling/Desktop_1/${screen}" = tiling work;
        "Tiling/Desktop_2/${screen}" = tiling thirds;
        "Tiling/Desktop_3/${screen}" = tiling thirds;
      };

      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.image";
        "Greeter/Wallpaper/org.kde.image/General" = {
          Image = wallpaper;
          PreviewImage = wallpaper;
        };
      };

      kdeglobals = {
        General = {
          AccentColor = "104,107,111";
          LastUsedCustomAccentColor = "104,107,111";
          UseSystemBell = true;
        };
        "KFileDialog Settings"."Show hidden files" = true;
      };

      auroraerc."kwin4_decoration_qml_plastik" = {
        titleAlignCenter = true;
        titleAlignLeft = false;
      };

      dolphinrc.MainWindow.MenuBar = "Disabled";

      kwalletrc.Wallet = {
        Enabled = false;
        "Launch Manager" = false;
      };
    };
  };
}
