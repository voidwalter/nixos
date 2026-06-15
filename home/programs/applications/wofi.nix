{
  programs.wofi = {
    enable = true;
    settings = {
      mode = "show";
      show = "drun";
      prompt = "search";
      location = "center";
      width = 520;
      allow_markup = true;
      term = "foot";
      lines = 8;

    };
    style = 
    ''
    * {
      font-family:  'Montserrat', 'Cantarell', 'Caladea', sans-serif;
      font-size: 20px;
      font-weight: 400;
    }


    #window {
        margin: 0px;
        border: none;
        border-color: #000000;
        border-radius: 20px;
        background-color: #121212;
        color:  #708879;
    }

    #input {
        margin: 25px;
        background-color: #444444;
        color: black;
        border-radius: 10px;
        border: none;
    }

    #scroll {
        margin-bottom: 25px;
    }

    #entry {
        margin: 0px 25px;
    }

    #entry:selected {
        background-color: #c3c7c9;
        border-radius: 10px;
        border: none;
        outline: none;
    }

    #entry > box {
        margin-left: 15px;
    }

    #entry image {
        padding-right: 10px;
    }
    '';
  };
}
