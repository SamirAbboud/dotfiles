from datetime import date
import os

layout = """
 > {distro()}
 > {kernel(small=False)}
 > {wm()}
 > {memory()}
 > {shell()}
 > {terminal()}
 > {icon_theme()}
 > {gtk_font()}
󰊠 > {packages()}
󰔚 > {uptime()}

{colors(char = "  ", normal_only=True, background=False)}

"""

logo = {
            "logo": """

         .
        / \\
       /   \\
      /^.   \\
     /  .-.  \\
    /  (   ) _\\
   / _.~   ~._^\\
  /.^         ^.\\
    
""", "main_color" : "\033[34m"
}

settings = {
    "layout": layout,

    #{cursor_theme()} {gpu_driver()} {gtk_font()}

    # dictionary with custom functions, if you want to display something yours
    # pass functions here, and insert them into layout as in example above 
    # format : 
    #     'function_name' : function 

    "custom_fetches" : {},

    "colorize_functions" : False,
    # colorize function's output or no. if you want to insert specific color for the specific function output in line, then.
    # functions will be colored as text color if set to False. 
    # you have to set this param to False. This will disable colorizing for all the functions. you'll have to manually insert 
    # color for every function.to do that, you can use the following syntax: 
    # {cN}, where N is a number from 1 to 16. example:
    #
    # {c6} CPU: {cpu()}
    # 
    # example above will colorize all the line if colorize_functions set to false. 
    # if colorize functions set to True, then only "CPU: " will be colored.
    # 
    # colors are like in the example below. just past color number you want. for example:
    # {c6} colorize to magenta
    # {c2} colorize to red

    "text_color" : "logo", 
    # the color text will displayed with, text only, not result of functions
    # values :
    # 1:    # black
    # 2:    # red
    # 3:    # green
    # 4:    # yellow
    # 5:    # blue
    # 6:    # magenta
    # 7:    # cyan
    # 8:    # white
    # 9:   # bright black
    # 10:  # bright red
    # 11: # bright green
    # 12: # bright yellow
    # 13: # bright blue
    # 14: # bright magenta
    # 15: # bright cyan
    # 16: # bright white
    
    "functions_color": 8,
    # color of function's output, values are the same

    "logo" : logo,
    # ascii logo to be displayed
    # values :
    #   'auto'   # automatically set logo 
    #   variable # dictionary with custom ascii art
    #       example and format:

    #       from colorama import Fore as f
    #
    #       example_logo = {
    #           "logo" : f"""{f.RED}
    #               /\\,-'''''-,/\\
    #               \\_)       (_/
    #               |  {f.WHITE}"    "{f.RED}   |
    #               |   {f.WHITE}----{f.RED}    |
    #               ;           ;
    #               "'-_____-'"
    #               """,
    #       "main_color" : f.RED  # main color of the logo. you can use ansii codes or python colorama module
    #                             # if logo is colorless leave it empy. if you have multicolored logo,
    #                             # manually insert colors per line, and set this as main color of logo
    #       }
     
    #   distro names:   # if you want exact distro ascci art, pass distro name with 'name_' prefix 
    #       name_arch (other are in progress)

    "logo_info_whitespace" : 8,
    # lenght of whitespace between logo and information

    "lstrip_info" : False,
    # remove whitespaces at the beginning of every layout line 

    "print_logo": True,
    # Print logo or no

    "logo_position": "left",
    # position where logo located.
    #   values:  'left', 'top', 'right', 'bottom' 
}