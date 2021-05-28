#!/data/data/com.termux/files/usr/bin/bash

#Setmux Final Version (FV)
#Author : XklienZ
#https://m.facebook.com/XklienZ


#Jika anda ingin masuk direktori dengan mudah
#anda bisa menggunakan script dibawah ini :
#https://github.com/XklienZ/als-command



trap "echo -e '\e[25?h\e[0m'; exit 1" SIGINT SIGTSTP SIGQUIT;

#Variable Color
M="\e[1;31m";
P="\e[1;37m";
G="\e[1;32m";
no="\e[0m";
ccyan="\e[1;32m"
clgreen="\e[1;32m";
cgreen="\e[0;32m";




function user_input_q () {

	while true; do
		read -rsN 1 user_quit;
		if [ "${user_quit,,}" == "q" ]; then
			echo -en "\e[0m\e[25?h"; return 0;
		else
			echo -en "\a";
		fi;
	done;
}



function low_print () {

	local string="$1";
	local length="${#string}";
	echo -en "\e[25?l";

	for (( i=0; i<length; i++ )); do
      		echo -n "${string:i:1}";
	    	sleep 0
	done;
	echo;
}



#function for slow printing point
function lo_ad () {

	points="...";
	echo -en "\e[25?l";

   	for (( i=0; i<${#points}; i++ )); do
        	echo -en "${points:i:1}";
        	sleep 1;
        	done;
   		echo;
}



#the users use termux?
function is_this_termux () {

 	if [ -d /data/data/com.termux ]; then
		return 0;
	else
		echo -e "\e[1;31m\a[X] oopss, yang sedang anda pakai bukan termux\e[0m"; 
      		echo -e "\e[1;37m[>]\e[1;36m script ini hanya untuk termux!!\e[0m"; sleep 3
	     	exit 1;
   fi
}



function logo_menu_xz () {

echo -e "\e[1;31m
___________________
_________________  \___________________________
                 \____________________________/
     \e[1;36m   ┏━┓
     \e[1;36m   ┃ ┃ __\e[1;36m __   ___         \e[1;36m_____
     \e[1;36m   ┃ ┃/ /\e[1;36m/ /__/ (_)__  ___\e[1;36m/__  /
     \e[1;36m   ┃   /\e[1;36m/ //_/ / / _ \/ __\e[1;36m \/ /
     \e[1;36m  /   ┃\e[1;36m/ ,< / / /  __/ / /\e[1;36m / /__
     \e[1;36m /_/┃ ┃\e[1;36m_/|_/_/_/\___/_/ /_\e[1;36m/____/
     \e[1;36m    \_/ \e[1;31m
___________________            FB & IG: XklienZ
_________________  \___________________________
                 \_____________________________\\ \e[0m";
}



function logo_help_menu () {

echo -e "\e[1;36m
.oo'   .oc..llllll.,c.   .:cc:'
.OM0.  .0Mc.0MMMMMx,X0.   lWMMW0,
 ,NMc   ,N0.:WNc;;,.oMd    xNc;oKc
  xMO    xMd.xMo.....ON,   .K0. :N:
  ;WWl,,;oWN;.KXllll..KO.   :Wx..KN'
   xMMMMMMMMk.cMMMMMk.\e[1;34mcWd    oWNWMMl
   'XMXOkkkNWc.0MOc:;..OW:    kMKxo..
    dMK....lWX'cWX.... ,NK.   .KK...
    ,WMl.  .0Md.xMo.   .cWO;;;::Xd
     kM0.   :WN'.KNO0KX0'xMMMMMxoWc
     :WMo   .kMx.lMMMMWNd,OOkxdo':;.
     .OMX'   'dl..:;,'..............
      .'..    ...........
       ...
";
}




#function to locate the user asset termux.properties file
function key_boardarrow () {

	#Looking for the same termux.properties
	clear;
 	echo -en "\e[25?l\e[1;36m[L] looking for the file (termux.properties)"; sleep 1; lo_ad; echo -en "\e[0m";

	if [ -d ~/.termux ]; then
		sleep 1;
     	loops_replace_file=true;
		while $loops_replace_file; do
	     	echo;
			if echo -en "\e[8m"; find -name termux.properties; then
				echo -en "\e[0m"
				if grep "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" ~/.termux/termux.properties; then					
					echo -e "\n\e[1;31m[X] sudah ada extra keyboard di termux anda!\e[0m"; echo -e "\e[25?h"; sleep 3;
					exit 1;
				else
					if [ -s termux.properties ]; then
						echo -e "\e[1;34mWARNING!!!\n\e[1;37mfile termux.properties akan dihapus,\nsilahkan pindahkan atau mengganti nama\nterlebih dahulu\e[0m";
						echo -en "Lanjut hapus? y/n : "; read rd-keyb;
						if [ "$rd-keyb" == "y" ]; then
							rm -v ~/.termux/termux.properties; 
						elif [ "$rd-keyb" == "n" ]; then
							exit 1;
						else
							exit 1;
						fi;
					else
						:
					fi;
				fi;
			fi;
		done;
	else
		:
	fi;
		clear;
		echo -e "\e[25?l\e[1;36m[L] make a keyboard spot\e[0m"; sleep 1;
		#create a (.termux) file if the user doesn't have one
		echo -e "\e[1;36m[L] create folder for keyboard\e[0m"; sleep 1
		cd $HOME; mkdir .termux; echo -e "\e[1;36m[L] set the place for the keyboard\e[0m";  sleep 1; 
		echo -e "\e[1;36m[L] create file for keyboard\e[0m"; sleep 1;
		#create a (termux.properties) in (.termux)
		cd .termux; touch termux.properties
		echo -e "\e[1;36m[L] Is setting up the keyboard\e[0m"; sleep 1; echo -e "\e[1;36m[L] add arrows to the keyboard\e[0m"; sleep 1;
		echo -e "\e[1;36m[L] add HOME and END to keybord\e[0m"; sleep 1; echo -e "\e[1;36m\e[1;36m\e[25?l[L] add PGUP and PGDN to keyboard"; sleep 1;
		echo -e "\e[1;36m[L] add / and ALT to keyboard\e[0m"; sleep 1;
		#code to send to .termux/termux.properties to display the arrow keyboard
		echo "extra-keys = [['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]" > /data/data/com.termux/files/home/.termux/termux.properties
		sleep 1; echo -e "\e[1;32m[Z] successful...\e[1;0m\a"; sleep 2;
		echo -e "\a\e[1;33m[i] buka NEW SESSION atau login ulang termux\n    agar extra keyboard terlihat!\e[1;0m\e[25?h\n"; sleep 3; exit 1
}







function main_help_propertiesc () {

	clear; logo_help_menu;
	echo -e "\n\e[0;36mApa tujuan Ubah warna termux diprogram ini?\nUntuk mengubah/mengganti warna : background,\nforeground, dan cursor ditermux anda.\nSehingga termux anda berwarna dari sebelumNya.\n\n\e[1;37mBANTUAN MENU :"
	echo -e "		\e[1;37m◇\e[1;36mEXIT\e[1;37m◇\e[0m\n  \e[0;32mKeluar dari program.\n"
	echo -e "		\e[1;37m◇\e[1;36mDefault\e[1;37m◇\e[0m\n  \e[0;32mWarna termux anda kembali seperti semula.\n"
	echo -e "		\e[1;37m◇\e[1;36mPilih warna\e[1;37m◇\e[0m\n  \e[0;32mPilih warna untuk termux anda.\n  \e[1;33mColor: Cyan, Hitam, Merah, Biru, Hijau, dsb.\n"
	echo -e "		\e[1;37m◇\e[1;36mBANTUAN\e[1;37m◇\e[0m\n  \e[0;32mMenampilkan ini.\e[0m\n"
	echo -e "\n		\e[1;34m[\e[1;36mq\e[1;34m]\e[1;37m.\e[1;36mBACK\e[25?l\e[0m";
	user_input_q; main_menu_color
}



function color_properties () {

	echo -e "
 \e[1;34m(\e[1;36m1\e[1;34m)\e[1;37m.merah      \e[1;34m(\e[1;36m10\e[1;34m)\e[1;37m.hijau jeruk nipis
 \e[1;34m(\e[1;36m2\e[1;34m)\e[1;37m.merah tua  \e[1;34m(\e[1;36m11\e[1;34m)\e[1;37m.magenta
 \e[1;34m(\e[1;36m3\e[1;34m)\e[1;37m.cyan       \e[1;34m(\e[1;36m12\e[1;34m)\e[1;37m.putih
 \e[1;34m(\e[1;36m4\e[1;34m)\e[1;37m.biru       \e[1;34m(\e[1;36m13\e[1;34m)\e[1;37m.perak
 \e[1;34m(\e[1;36m5\e[1;34m)\e[1;37m.biru tua   \e[1;34m(\e[1;36m14\e[1;34m)\e[1;37m.abu-abu
 \e[1;34m(\e[1;36m6\e[1;34m)\e[1;37m.biru muda  \e[1;34m(\e[1;36m15\e[1;34m)\e[1;37m.hitam
 \e[1;34m(\e[1;36m7\e[1;34m)\e[1;37m.ungu       \e[1;34m(\e[1;36m16\e[1;34m)\e[1;37m.oren jeruk
 \e[1;34m(\e[1;36m8\e[1;34m)\e[1;37m.kuning     \e[1;34m(\e[1;36m17\e[1;34m)\e[1;37m.cokelat
 \e[1;34m(\e[1;36m9\e[1;34m)\e[1;37m.hijau      \e[1;34m(\e[1;36m18\e[1;34m)\e[1;37m.zaitun
";
}



function main_default_properties () {

	cd $HOME;
	if [ -d .termux ]; then
		cd .termux;
		if [ -f colors.properties ]; then
			rm -f colors.properties;
			clear; echo -e "\e[1;32m[Z] warna termux anda sudah kembali ke semula\n    (default).\e[0m\n"; sleep 1; exit 0;
		else
			clear; echo -e "\e[1;33m[i] warna termux anda sudah default!\e[0m\n"; sleep 1; exit 0;
		fi;
	else
			clear; echo -e "\e[1;33m[i] warna termux anda sudah default!\e[0m\n"; sleep 1; exit 0;
	fi;
	cd; $HOME;
}



function main_properties () {
	varstop="echo hentikan script CTRL+C";
	cd $HOME
	if [ -d .termux ]; then
			cd .termux;
		if [ -f colors.properties ]; then
			loops_properties=true;
			while $loops_properties; do
				clear; echo -e "\e[1;36mfile ditemukan!\e[0m\n";
				echo -e "	\e[1;32m[\e[1;36m1\e[1;32m]\e[0m.\e[1;36mGanti nama file  \e[1;32m[\e[1;36m2\e[1;32m]\e[0m.\e[1;36mHapus\e[0m\n";
				echo -en "pilih > "; read repmove;
				if [ "$repmove" == "1" ]; then
					while true; do
						clear; echo -e "\e[0m	*RENAME FILES*\n";
						echo -en "rename : "; read rename_properties;
						if [ "$rename_properties" == "" ]; then
							echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1
						elif [ -f colors.properties$rename_properties ]; then
							echo -e "\e[1;31m[X] sudah ada nama file seperti itu!\e[0m"; sleep 1;
						else
							if [ -f colors.properties ]; then
								clear; mv colors.properties colors.properties$rename_properties;
								echo -e "\e[1;32m[Z] berhasil mengganti nama file..\e[0m"; sleep 2; break;
							else
								echo -e "\e[1;31m[X] kesalahan tidak diketahui!\nfile untuk mengganti color termux tidak dapat ditemukan!\e[0m"; sleep 1;
								exit 1;
							fi;
						fi;
					done; break;
				elif [ "$repmove" == "2" ]; then
					rm -f colors.properties; cd $HOME; break;
				else
					echo -e "\e[1;31m[X]tidak ada pilihan yang tepat!\e[0m"; sleep 1
					loops_properties=true;
				fi;
			done;
		else
			cd $HOME/.termux; touch colors.properties;cd $HOME;
		fi;
	else
		cd $HOME; mkdir .termux; cd .termux; touch colors.properties; cd $HOME;
	fi;
whl=true;
while $whl; do
	while true; do
		clear; echo -e "\e[0m"; $varstop; echo -e "
  \e[0m*PILIH WARNA UNTUK \e[1;36mBACKGROUND\e[0m TERMUX ANDA*\n
 \e[1;34m(\e[1;36m1\e[1;34m)\e[1;37m.merah      \e[1;34m(\e[1;36m10\e[1;34m)\e[1;37m.hijau jeruk nipis
 \e[1;34m(\e[1;36m2\e[1;34m)\e[1;37m.merah tua  \e[1;34m(\e[1;36m11\e[1;34m)\e[1;37m.magenta
 \e[1;34m(\e[1;36m3\e[1;34m)\e[1;37m.cyan       \e[1;34m(\e[1;36m12\e[1;34m)\e[1;37m.putih
 \e[1;34m(\e[1;36m4\e[1;34m)\e[1;37m.biru       \e[1;34m(\e[1;36m13\e[1;34m)\e[1;37m.perak
 \e[1;34m(\e[1;36m5\e[1;34m)\e[1;37m.biru tua   \e[1;34m(\e[1;36m14\e[1;34m)\e[1;37m.abu-abu
 \e[1;34m(\e[1;36m6\e[1;34m)\e[1;37m.biru muda  \e[1;34m(\e[1;36m15\e[1;34m)\e[1;37m.hitam
 \e[1;34m(\e[1;36m7\e[1;34m)\e[1;37m.ungu       \e[1;34m(\e[1;36m16\e[1;34m)\e[1;37m.oren jeruk
 \e[1;34m(\e[1;36m8\e[1;34m)\e[1;37m.kuning     \e[1;34m(\e[1;36m17\e[1;34m)\e[1;37m.cokelat
 \e[1;34m(\e[1;36m9\e[1;34m)\e[1;37m.hijau      \e[1;34m(\e[1;36m18\e[1;34m)\e[1;37m.zaitun";
		declare -A color_background=(["1"]="#FF0000" ["2"]="#800000" ["3"]="#00FFFF" ["4"]="#0000FF" ["5"]="#0000A0" ["6"]="#ADD8E6" ["7"]="#800080" ["8"]="#FFFF00" ["9"]="#008000" ["10"]="#00FF00" ["11"]="#FF00FF" ["12"]="#FFFFFF" ["13"]="#C0C0C0" ["14"]="#808080" ["15"]="#000000" ["16"]="#FFA500" ["17"]="#A52A2A" ["18"]="#808000");
		echo -e "\e[25?h[E] example : color > 15";
		echo -en "color > "; read input_color_bg;
		convert_color_bg="${color_background["${input_color_bg:-none}"]}";
		if [ "$input_color_bg" == "" ]; then
			echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1
		elif [ -v color_background["${input_color_bg}"] ]; then
			clear; break;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!!\e[0m"; sleep 1
		fi;
	done;
	while true; do
		clear; echo -e "\e[0m"; $varstop; echo -e "   \e[0m*PILIH WARNA UNTUK \e[1;36mFOREGROUND\e[0m TERMUX ANDA*";
		color_properties;
		declare -A color_foreground=(["1"]="#FF0000" ["2"]="#800000" ["3"]="#00FFFF" ["4"]="#0000FF" ["5"]="#0000A0" ["6"]="#ADD8E6" ["7"]="#800080" ["8"]="#FFFF00" ["9"]="#008000" ["10"]="#00FF00" ["11"]="#FF00FF" ["12"]="#FFFFFF" ["13"]="#C0C0C0" ["14"]="#808080" ["15"]="#000000" ["16"]="#FFA500" ["17"]="#A52A2A" ["18"]="#808000");
		echo -en "color > "; read input_color_fg;
		convert_color_fg="${color_foreground["${input_color_fg:-none}"]}";
		if [ "$input_color_fg" == "$input_color_bg" ]; then
			echo -e "\e[1;31m[X] warna tidak boleh sama!\e[0m"; sleep 1;
		else
			if [ -v color_foreground["${input_color_fg}"] ]; then
				clear; break;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!!\e[0m"; sleep 1;
			fi;
		fi;
	done;
	while true; do
		clear; echo -e "\e[0m"; $varstop; echo -e "   \e[0m*PILIH WARNA UNTUK \e[1;36mCURSOR\e[0m TERMUX ANDA*";
		color_properties;
		declare -A color_cursor=(["1"]="#FF0000" ["2"]="#800000" ["3"]="#00FFFF" ["4"]="#0000FF" ["5"]="#0000A0" ["6"]="#ADD8E6" ["7"]="#800080" ["8"]="#FFFF00" ["9"]="#008000" ["10"]="#00FF00" ["11"]="#FF00FF" ["12"]="#FFFFFF" ["13"]="#C0C0C0" ["14"]="#808080" ["15"]="#000000" ["16"]="#FFA500" ["17"]="#A52A2A" ["18"]="#808000");
		echo -en "color > "; read input_color_cursor;
		convert_color_cursor="${color_cursor["${input_color_cursor:-none}"]}";
		if [ "$input_color_cursor" != "$input_color_fg" ] && [ "$input_color_cursor" != "$input_color_bg" ]; then
			if [ -v color_cursor["${input_color_cursor}"] ]; then
				clear; break;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!!\e[0m"; sleep 1;
			fi;
		else
			echo -e "\e[1;31m[X] warna tidak boleh sama!\e[0m"; sleep 1;
		fi;
	done;
	cd $HOME/.termux;
	echo "
background:	$convert_color_bg
foreground:	$convert_color_fg
cursor:	$convert_color_cursor

" > colors.properties;
termux-reload-settings;
done;
}



function main_menu_color () {

	while true; do
		clear;
		echo -e "\n	\e[1;32m[\e[1;36m0\e[1;32m]\e[1;37m.\e[1;34mEXIT\e[0m";
		echo -e "	\e[1;32m[\e[1;34m1\e[1;32m]\e[1;37m.\e[1;36mdefault (warna default)\e[0m";
		echo -e "	\e[1;32m[\e[1;34m2\e[1;32m]\e[1;37m.\e[1;36mPilih Warna\e[0m";
		echo -e "	\e[1;32m[\e[1;36m3\e[1;32m]\e[1;37m.\e[1;32mBANTUAN\e[0m\n";
		echo -en "pilih > "; read input_menu_color;
		if [ "$input_menu_color" == "0" ]; then
			exit 1;
		elif [ "$input_menu_color" == "1" ]; then
			main_default_properties;
		elif [ "$input_menu_color" == "2" ]; then
			main_properties;
		elif [ "$input_menu_color" == "3" ]; then
			main_help_propertiesc;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
		fi;
	done;


}






#Variable
folder_etc="/data/data/com.termux/files/usr/etc/"



function logo_menu_prompt () {

	echo -e '\e[1;36m
___________________
\________________  \\__________________
                 \\___________________/\e[1;34m
    ____                             __
   / __ \_________  ____ ___  ____  / /_
  / /_/ / ___/ __ \/ __ `__ \/ __ \/ __/
 / ____/ /  / /_/ / / / / / / /_/ / /_
/_/   /_/   \____/_/ /_/ /_/ .___/\__/
                          /_/\e[1;31m
            ______                         _  __
           /_  __/__  _________ ___  __  _| |/ /
            / / / _ \/ ___/ __ `__ \/ / / /   /
           / / /  __/ /  / / / / / / /_/ /   |
          /_/  \___/_/  /_/ /_/ /_/\__,_/_/|_|\e[1;36m
        _________________
       /_______________  \\______________________
                       \\_______________________/\e[0m\e[25?h';
}




function lan_nue () {
     echo -e "\e[25?l\n\n##TEKAN ENTER UNTUK MELANJUTKAN##"
			 read -sp "" en_ter
     echo -en "\e[25?h"
     return 0
}



function out_low () {

     local string="$1"
     local length=${#string}
     echo -en "\e[25?l";

     for ((i=0; i<length; i++)); do
          echo -en "${string:i:1}";
          sleep 0.1
     done
     echo;
}



function run_color () {

     clear
     echo -e "\e[25?h	\e[0m*PILIH WARNA*";
     echo -e "
 $no($ccyan 1 $no) none
 $no($ccyan 2 $no)\e[0;31m red
 $no($ccyan 3 $no)\e[1;31m light_red
 $no($ccyan 4 $no)\e[0;32m green
 $no($ccyan 5 $no)\e[1;32m light_green
 $no($ccyan 6 $no)\e[0;33m orange
 $no($ccyan 7 $no)\e[0;34m blue
 $no($ccyan 8 $no)\e[1;34m light_blue
 $no($ccyan 9 $no)\e[0;35m purple
 $no($ccyan 10 $no)\e[1;35m light_purple
 $no($ccyan 11 $no)\e[0;36m cyan
 $no($ccyan 12 $no)\e[1;36m light_cyan
 $no($ccyan 13 $no)\e[0;37m light_gray
 $no($ccyan 14 $no) dark_gray (font sulit di lihat)
 $no($ccyan 15 $no)\e[1;33m yellow
 $no($ccyan 16 $no)\e[1;37m white";
}


function create_file_prompt () {

	cd $folder_etc; touch bash.bashrc
}



function save_bashrc_function () {
   echo '
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
   command_not_found_handle() {
   /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
   }
fi
   ' > /data/data/com.termux/files/usr/etc/bash.bashrc;
}



function message_save_prompt () {

	while true; do
		cd $folder_etc;
		if [ -f bash.bashrc ]; then
			clear
			echo -e "\e[1;32m[Z] berhasil mengganti prompt\e[0m\a"; sleep 1
			echo -e "\e[1;33m[i] harap buka NEW SESSION atau login ulang termux\e[25?h\e[0m\n"; sleep 2
			exit 0;
		else
			clear; sleep 2; echo -e "
\e[1;31m**   **     \e[1;31m[X] GAGAL MEMBUAT FILE!\e[0m
\e[1;31m ** ** \e[1;31mKESALAHAN TIDAK DIKETAHUI\e[0m
\e[1;31m  ***  \e[0mJika terus gagal membuat file, anda
\e[1;31m  ***  \e[0mbisa hubungi XklienZ melalui facebook :
\e[1;31m ** ** \e[0mhttps://m.facebook.com/XklienZ\e[0m
\e[1;31m**   ** \e[0m";
			echo -e "\n\e[0m[\e[1;36m1\e[0m].\e[1;34mHubungi  \e[0m[\e[34m2\e[0m].\e[1;36mTidak\n\n";
     	     echo -en "\e[0mpilih > "; read contact_xz;
			if [ "$contact_xz" == "1" ]; then
          		echo -e "\e[25?l";
				report_xz="$(am start -n com.android.chrome/com.google.android.apps.chrome.Main -d "https://m.facebook.com/XklienZ" 2>&1 > /dev/null)";
				if [ -z "$report_xz" ]; then
					exit 1;
				else
					echo -e "\e[25?h\e[0m\e[1;31m[X] gagal memghubungi XklienZ, karena apk chrome tidak bisa di buka atau tidak terinstall di ponsel anda!\e[0m";
					exit 1;
				fi;
			elif [ "$contact_xz" == "2" ]; then
				exit 1;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			fi;
		fi;
	done;
}

function find_bashrc_prompt () {

	cd $folder_etc;
	while true; do
		if [ bash.bashrc ]; then
			clear;
			echo -e "\e[1;34mfile bash.bashrc ditemukan..\n";
			echo -e " \e[1;32m[\e[1;36m1\e[1;32m]\e[0m.\e[1;36mGanti nama file  \e[1;32m[\e[1;36m2\e[1;32m]\e[0m.\e[1;36mHapus\e[0m\n";
			echo -en "pilih > "; read up_to_prompt;
			if [ "$up_to_prompt" == "1" ]; then
				example_rename; rename_bashrc_function;
				view_bashrc_function;
			elif [ "$up_to_prompt" == "2" ]; then
				rm -f bash.bashrc; break;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1
			fi;
		else
			break; return 0;
		fi;
	done;
}

function rename_bashrc_function () {

     local loops_renrc=true
     cd $folder_etc

     while $loops_renrc; do
          clear;
          echo -e "*RENAME FILES*\n";
          echo -en "\e[25?hRename : "; read name_bashrc;
          if [ "$name_bashrc" == "" ]; then
               echo -e "\e[25?l\e[1;31m\a[X] harus di isi!\e[0m\e[0m";
               echo -e "\e[1;33m[i] karena ini terkait dengan file anda!\e[0m"; sleep 3;
               loops_renrc=true;

          elif [ -f bash.bashrc$name_bashrc ]; then
               echo -e "\e[1;31m[X] sudah ada nama file seperti itu!\e[0m"; sleep 2;
               loops_renrc=true;
          else
			clear; break;
          fi;
     done;

     cd $folder_etc;
	if [ -f bash.bashrc ]; then
	     mv bash.bashrc "bash.bashrc$name_bashrc";
	     cd $HOME;
		echo -e "\e[1;32m[Z] Berhasil Mengganti nama file bash.bashrc\n    menjadi bash.bashrc$name_bashrc\e[0m"; sleep 2; lan_nue
	else
		echo -e "\e[1;31m[X] kesalahan tidak diketahui, file bash.bashrc tidak ditemukan!\e[0m";
		exit 1;
	fi;
}



function example_rename () {

      clear;
      echo -e "\e[1;33m[i] usahakan nama filenya yang belum pernah ada di file sebelumNya ya..\n"; sleep 0.10;
      echo -e "\e[1;36m[L] lihat contoh dibawah ini!!\n"; sleep 0.10;
      echo -e "\e[1;36m[E] example"; sleep 0.10;
      echo -en "Rename : \e[1;36m"; sleep 3; out_low "-old-1"; sleep 1;
      echo -e "\e[0m\e[25h\n\n";
      lan_nue;

}



function view_bashrc_function () {

	local loops_viewbashrc=true;

	while $loops_viewbashrc; do
		clear;
		echo -e "\n\e[1;33m[i] file yang telah anda rename ada di direktori :";
     	echo -e "\e[1;36m/data/data/com.termux/files/usr/etc/bash.bashrc$name_bashrc\e[0m";
	     read -p "apakah anda ingin melihatNya? y/n : " view_bashrc_1;
		 if [ "${view_bashrc_1,,}" == "y" ]; then
			clear; cd $folder_etc; ls;
			echo -e "\n\nFile yang anda rename : bash.bashrc$name_bashrc";
			lan_nue;
			break;
	      elif [ "${view_bashrc_1,,}" == "n" ]; then
     	 	break;
	      else
     	 	echo -e "\e[1;31m\a[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
	          loops_viewbashrc=true;
      	 fi;
	done;
}



function user_prompt_1 () {

	local nameprompt1_loops=true;

	while $nameprompt1_loops; do
		clear; echo -e "\e[26?h\e[0m	*NAMA UNTUK PROMPT*\n";
		echo -en "username : "; read name_prompt_1;
		if [ "$name_prompt_1" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m\e[0m"; sleep 1;
			nameprompt1_loops=true;
		else
			break;
		fi;
	done;

   #UserSetPrompt
	local loops_setprompt1=true;

	while $loops_setprompt1; do
		clear; echo -e "	\e[0m*SET PROMPT root*"; echo;
		echo -e "\e[44;36;5mroot\e[0m@$name_prompt_1:~$ "; echo;
		echo -e "Ubah \e[44;36;5mroot\e[0m menjadi ...\n"; echo;
		echo -e "[E] example : terminal@$name_prompt_1:~$";
		echo -en "ubah >  "; read set_prompt_1;
		if [ "$set_prompt_1" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m\e[0m"; sleep 1;
			loops_setprompt1=true;
		else
			break;
		fi;
	done;

			#UserColom
	local loops_usercolom1=true

	while $loops_usercolom1; do
		clear; echo -e "\e[0m	*SET PROMPT @*\n";
		echo -e "$set_prompt_1\e[44;36;5m@\e[0m$name_prompt_1:~$ ";
		echo -e "Ubah \e[44;36;5m@\e[0m menjadi ...\n";
		echo -e "[E] example : $set_prompt_1~$name_prompt_1:~$ ";
		echo -en "\e[25?hubah >  "; read user_colom_1;
		if [ "$user_colom_1" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m\e[0m"; sleep 1;
			loops_usercolom1=true;
		else
			break;
		fi;
	done;
	set_color_1;
}

function execute_function () {

	find_bashrc_prompt; create_file_prompt; save_bashrc_function;
}



function execute_function2 () {

	create_file_prompt; save_bashrc_function;
}



function set_color_1 () {

	local loops_color=true;

	while $loops_color; do
		clear; echo -e "	\e[0m*PILIH WARNA UNTUK PROMPT*";
		echo -e "\e[0m\nPrompt anda : \e[0m$set_prompt_1$user_colom_1$name_prompt_1:~$"; sleep 1
		echo -e "
 $no($ccyan 1 $no) none
 $no($ccyan 2 $no)\e[0;31m red
 $no($ccyan 3 $no)\e[1;31m light_red
 $no($ccyan 4 $no)\e[0;32m green
 $no($ccyan 5 $no)\e[1;32m light_green
 $no($ccyan 6 $no)\e[0;33m orange
 $no($ccyan 7 $no)\e[0;34m blue
 $no($ccyan 8 $no)\e[1;34m light_blue
 $no($ccyan 9 $no)\e[0;35m purple
 $no($ccyan 10 $no)\e[1;35m light_purple
 $no($ccyan 11 $no)\e[0;36m cyan
 $no($ccyan 12 $no)\e[1;36m light_cyan
 $no($ccyan 13 $no)\e[0;37m light_gray
 $no($ccyan 14 $no) dark_gray (font sulit di lihat)
 $no($ccyan 15 $no)\e[1;33m yellow
 $no($ccyan 16 $no)\e[1;37m white";

		declare -A user_array_1=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		echo -e "\e[25?h[E] example : color > 15";
		read -p "color > " color_prompt;
 		user_color_1="${user_array_1["${color_prompt:-none}"]}";
		if [ "$color_prompt" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			loops_color=true;
		elif [ -v user_array_1["${color_prompt:-none}"] ]; then
			break;
		else
			echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_color=true;
		fi;
	done;
	while $loops_color; do
		clear; echo -e "	\e[0m*PILIH WARNA UNTUK TEKS PROMPT*\n";
		echo -e "$user_color_1$set_prompt_1$user_colom_1$name_prompt_1:~$ \e[1;4;36mpkg update && pkg upgrade\e[0m";
		echo -e "\n\e[0mMemberi warna untuk yang digaris bawahi"; sleep 1
		echo -e "
 $no($ccyan 1 $no) none
 $no($ccyan 2 $no)\e[0;31m red
 $no($ccyan 3 $no)\e[1;31m light_red
 $no($ccyan 4 $no)\e[0;32m green
 $no($ccyan 5 $no)\e[1;32m light_green
 $no($ccyan 6 $no)\e[0;33m orange
 $no($ccyan 7 $no)\e[0;34m blue
 $no($ccyan 8 $no)\e[1;34m light_blue
 $no($ccyan 9 $no)\e[0;35m purple
 $no($ccyan 10 $no)\e[1;35m light_purple
 $no($ccyan 11 $no)\e[0;36m cyan
 $no($ccyan 12 $no)\e[1;36m light_cyan
 $no($ccyan 13 $no)\e[0;37m light_gray
 $no($ccyan 14 $no) dark_gray (font sulit di lihat)
 $no($ccyan 15 $no)\e[1;33m yellow
 $no($ccyan 16 $no)\e[1;37m white";
		declare -A array_color_command=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		echo -e "\e[25?h[E] example : color > 15";
		read -p "color > " color_prompt_command;
		var_color_command="${array_color_command["${color_prompt_command:-none}"]}";
		if [ "$color_prompt_command" == "" ]; then
			echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1
			loops_color=true
		elif [ -v array_color_command["${color_prompt_command:-none}"] ]; then
			break;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1
			loops_color=true
		fi
	done;

		cd $folder_etc;
		if [ -f bash.bashrc ]; then
			execute_function;
			echo "
PS1='\\[$user_color_1\\]$set_prompt_1$user_colom_1$name_prompt_1:~\\$\\[$var_color_command\\] '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
			message_save_prompt;
		else
			execute_function2;
			echo "
PS1='\\[$user_color_1\\]$set_prompt_1$user_colom_1$name_prompt_1:~\\$\\[$var_color_command\\] '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
			message_save_prompt;
		fi;
}



#FUNCTION PROMPT 2
function user_prompt_2 () {

	local loops_prompt_2=true;

	while $loops_prompt_2; do
		clear; echo -e "	\e[25?h*NAMA UNTUK PROMPT*\n";
		echo -en "username : "; read name_prompt_2;
	if [ "$name_prompt_2" == "" ]; then
		echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
		$loops_prompt_2=true;
	else
		break;
	fi;
	done;

	local loops_clp=true;

	while $loops_clp; do
		clear; echo -e "	\e[0m*PILIH UNTUK PROMPT TERMUX ANDA*\n";
		echo -e "\e[0m[\e[1;36m1\e[0m]\n\e[44;32;5m[$direk]\e[0m\n\e[34;4m{$name_prompt_2@$host}\e[0m\n\e[0;32m$\e[0m\n";
		echo -e "\e[0m[\e[1;36m2\e[0m]\n\e[42;34;5m[$direk]\e[0m\n\e[32;4m{$name_prompt_2@$host}\n\e[0;32m$\e[0m\n";
		echo -e "\e[0m[\e[1;36m3\e[0m]\n\e[1;31m[\e[44;32;5m$direk\e[0m\e[1;31m]\e[0m\n\e[1;33m{\e[34;4m$name_prompt_2@localhost\e[0m\e[1;33m}\e[0m\n\e[0;32m$\e[0m\n";
		echo -e "\e[0m[\e[1;36m4\e[0m]\n\e[1;33m[\e[42;34;5m$direk\e[0m\e[1;33m]\e[0m\n\e[1;31m{\e[32;4m$name_prompt_2@localhost\e[0m\e[1;31m}\e[0m\n\e[0;32m$\e[0m\n";
		echo -e "\e[0m[\e[1;36m5\e[0m]\n\e[44;37;5m[$direk]\e[0m\n\e[1;37m{\e[1;32m$name_prompt_2\e[1;31m@\e[1;32mlocalhost\e[0m}\n$\n";
		echo -en "pilih > "; read user_pilprompt_2;

		if [ "$user_pilprompt_2" == "1" ]; then
			clear; cd $folder_etc;
			if [ -f bash.bashrc ]; then
				execute_function;
				save_bashrc_function;
				echo "
PS1='\\[\e[44;32;5m\\][\w]\\[\e[0m\\]\n\\[\e[34;4m\\]{$name_prompt_2@\h}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
			message_save_prompt; break;
			else
				execute_function2;
				echo "
PS1='\\[\e[44;32;5m\\][\w]\\[\e[0m\\]\n\\[\e[34;4m\\]{$name_prompt_2@\h}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt;
			fi;
		elif [ "$user_pilprompt_2" == "2" ]; then
			clear; cd $folder_etc;
			if [ -f bash.bashrc ]; then
				execute_function;
				save_bashrc_function;
				echo "
PS1='\\[\e[42;34;5m\\][$\w]\\[\e[0m\\]\n\\[\e[32;4m\\]{$name_prompt_2@\h}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
			message_save_prompt; break;
			else
				execute_function2;
				echo "
PS1='\\[\e[42;34;5m\\][$\w]\\[\e[0m\\]\n\\[\e[32;4m\\]{$name_prompt_2@\h}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt;
			fi;
		elif [ "$user_pilprompt_2" == "3" ]; then
			clear; cd $folder_etc;
			if [ -f bash.bashrc ]; then
				execute_function;
				save_bashrc_function;
				echo "
PS1='\\[\e[1;31m\\][\\[\e[44;32;5m\\]\w\\[\e[0m\e[1;31m\\]]\\[\e[0m\\]\n\\[\e[1;33m\\]{\\[\e[34;4m\\]$name_prompt_2@\h\\[\e[0m\e[1;33m\\]}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt; break;
			else
				execute_function2
				echo "
PS1='\\[\e[1;31m\\][\\[\e[44;32;5m\\]\w\\[\e[0m\e[1;31m\\]]\\[\e[0m\\]\n\\[\e[1;33m\\]{\\[\e[34;4m\\]$name_prompt_2@\h\\[\e[0m\e[1;33m\\]}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt
			fi;
		elif [ "$user_pilprompt_2" == "4" ]; then
			clear; cd $folder_etc;
			if [ -f bash.bashrc ]; then
				execute_function;
				save_bashrc_function;
				echo "
PS1='\\[\e[1;33m\\][\\[\e[42;34;5m\\]\w\\[\e[0m\e[1;33m\\]]\\[\e[0m\\]\n\\[\e[1;31m\\]{\\[\e[32;4m\\]$name_prompt_2@\h\\[\e[0m\e[1;31m\\]}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt;
			else
				execute_function2;
				echo "
PS1='\\[\e[1;33m\\][\\[\e[42;34;5m\\]\w\\[\e[0m\e[1;33m\\]]\\[\e[0m\\]\n\\[\e[1;31m\\]{\\[\e[32;4m\\]$name_prompt_2@\h\\[\e[0m\e[1;31m\\]}\\[\e[0m\e[0;32m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
			message_save_prompt; break;
			fi;
		elif [ "$user_pilprompt_2" == "5" ]; then
			clear; cd $folder_etc;
			if [ -f bash.bashrc ]; then
				execute_function;
				save_bashrc_function;
				echo "
PS1='\\[\e[44;37;5m\\][\w]\\[\e[0m\\]\n\\[\e[1;37m\\]{\\[\e[1;32m\\]$name_prompt_2\\[\e[1;31m\\]@\\[\e[1;32m\\]\h\\[\e[0m\\]}\\[\e[0m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt
			else
				execute_function2
				echo "
PS1='\\[\e[44;37;5m\\][\w]\\[\e[0m\\]\n\\[\e[1;37m\\]{\\[\e[1;32m\\]$name_prompt_2\\[\e[1;31m\\]@\\[\e[1;32m\\]\h\\[\e[0m\\]}\\[\e[0m\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
				message_save_prompt; break;
			fi;
		else
			echo -e "\e[1;31m\a[X] oopss,tidak ada menu!\e[0m"; sleep 1; clear;
			loops_clp=true;
		fi;
	done;
}



#FUNCTION PROMPT 3
function user_prompt_3 () {

	local loops_prompt_3=true;

	while $loops_prompt_3; do
		clear; echo -e "	\e[0m*NAMA UNTUK PROMPT*\n";
		echo -en "username : "; read name_prompt_3;
		if [ "$name_prompt_3" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			loops_prompt_3=true;
		else
			break;
		fi;
	done;

	local loops_stripe=true;

	while $loops_stripe; do
		clear; echo -e "	\e[0m*MEMBERI WARNA UNTUK*";
		echo -e "\e[0m╔[ ═ ]\n╠{  }"; lan_nue
		run_color;
		declare -A user_array_3=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		echo -e "\e[25?h[E] example : color > 15";
		read -p "color > " color_prompt_3;

		user_color_3="${user_array_3["${color_prompt_3:-none}"]}";

		if [ "$color_prompt_3" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			loops_stripe=true;
		elif [ -v user_array_3["${color_prompt_3:-none}"] ]; then
			break;
		else
			echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_stripe=true;
		fi;
	done;

	while $color_stripe; do
		clear; echo -e "	\e[0m*MEMBERI WARNA UNTUK*";
		echo -e "nama anda : $name_prompt_3 dan $host"; lan_nue
		run_color;
		echo -e "\e[25?h[E] example : color > 15";
		read -p "color > " color_prompt_4;

		user_color_4="${user_array_3["${color_prompt_4:-none}"]}";
		if [ "$color_prompt_4" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			loops_stripe=true;
		elif [ -v user_array_3["${color_prompt_4:-none}"] ]; then
			break;
		else
			echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_stripe=true;
		fi;
	done;

	while $color_stripe; do
		clear; echo -e "	\e[0m*MEMBERI WARNA UNTUK*";
		echo -e "DIREKTORI atau { $direk }"; lan_nue
		run_color;
		echo -e "\e[25?h[E] example : color > 15";
		read -p "color > " color_prompt_5;

		user_color_5="${user_array_3["${color_prompt_5:-none}"]}";
		if [ "$color_prompt_5" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			loops_stripe=true;
		elif [ -v user_array_3["${color_prompt_5:-none}"] ]; then
			break;
		else
			echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_stripe=true;
		fi;
	done;

	while $color_stripe; do
		clear; echo -e "	\e[0m*MEMBERI WARNA UNTUK*";
		echo -e "$"; lan_nue
		run_color;
		echo -e "\e[25?h[E] example : color > 15";
		read -p "color > " color_prompt_6;

		user_color_6="${user_array_3["${color_prompt_6:-none}"]}";
		if [ "$color_prompt_6" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			loops_stripe=true;
		elif [ -v user_array_3["${color_prompt_6:-none}"] ]; then
			break;
		else
			echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_stripe=true;
		fi;
	done;
	clear; cd $folder_etc;
	if [ -f bash.bashrc ]; then
		execute_function;
		echo "
PS1='\\[$user_color_3\\]╔\\[$user_color_3\\][\\[$user_color_4\\]$name_prompt_4$name_prompt_3\\[$user_color_3\\]═\\[$user_color_4\\]\h\\[$user_color_3\\]]\n\\[$user_color_3\\]╠\\[$user_color_3\\]{\\[$user_color_5\\]\w\\[$user_color_3\\]}\\[$user_color_6\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
		message_save_prompt;
	else
		execute_function2
		echo "
PS1='\\[$user_color_3\\]╔\\[$user_color_3\\][\\[$user_color_4\\]$name_prompt_4$name_prompt_3\\[$user_color_3\\]═\\[$user_color_4\\]\h\\[$user_color_3\\]]\n\\[$user_color_3\\]╠\\[$user_color_3\\]{\\[$user_color_5\\]\w\\[$user_color_3\\]}\\[$user_color_6\\]\n\\$ '" >> /data/data/com.termux/files/usr/etc/bash.bashrc;
	message_save_prompt; break;
	fi;
}


function main_prompt () {

	loops_usermil=true
	who=`whoami`
	host=`hostname`
	dt=`date`
	direk=`pwd`

	while true; do
		clear;
		echo -en "\e[25?h\e[0m\nnama anda?> "; read usr_name;
		if [ "$usr_name" == "" ]; then
			echo -e "\e[1;31m[X] haru di isi!\e[0m"; sleep 1;
		else
			break;
		fi;
	done;

      while $loops_usermil; do
         clear; logo_menu_prompt;
         echo -e "		\e[0m*PILIH PROMPT*"; echo;
         echo -e " \e[1;37m[\e[1;36m1\e[1;37m]\e[0m
     root@$usr_name:~$
         ";
         echo; echo -e " \e[1;37m[\e[1;36m2\e[1;37m]\e[0m
     \e[44;37;5m[$direk]\e[0m
     {\e[36;4m$usr_name@$host\e[0m}
     $
         ";
         echo -e " \e[1;37m[\e[1;36m3\e[1;37m]\e[0m\n
     ╔[$usr_name═$host]
     ╠{$direk}
     $


         ";
         echo; echo -en "masukan menu > "; read inpt_prompt;
         if [ "$inpt_prompt" == "1" ]; then
            user_prompt_1; break;
         elif [ "$inpt_prompt" == "2" ]; then
            user_prompt_2; break;
         elif [ "$inpt_prompt" == "3" ]; then
            user_prompt_3; break;
         else
            echo -e "\e[1;31m\a[X] oopss; tidak ada menu!\e[0m"; sleep 1;
            loops_usermil=true;
         fi;
      done;
}









#Variable Color
no="\e[0m";
ccyan="\e[1;36m";
clgreen="\e[1;32m";
cgreen="\e[0;32m";



function jp_text_crml () {

	echo "
clear; echo -e '$convert_color_text
                  .        .
               ;,.           ,,
             lk.              .Oc
           .0K                 .XO.
           KMo                  dMO
          ;MMo                  dMM,
          lMMX.  .:dk0KK0kd:.  .NMM:
          ,MMMK.cWMNOxddxONMW:,XMMM.
         .;NMMMMkc.        ,cOMMMMK..
     .l0WMMMMMMMMMW0do.,ox0WMMMMMMMMMNkc.
   .OMWKkxdxk0WMMMMMNd..dNMMMMMWKOkkk0XMWk.
  xWx,     kKx..oNMW.    .WMWx,.dOx    .;kWd
 oO.       kMM,  .ll;.  .;lo.  ,MMk       .0l
 x         .WMK.   oMMNNMMo   .KMW,         x
.,          ,NMNc  .WMMMMW.  :NMN;          ;.
 .           .xWMNd.WMMMMW.oXMWk.           .
               .cklcMMMMMM:d0l.
                  ;NMMMMMMN,
                ;0MMMK:lXMMMk.
      .;;;;:oONMW0o.    ,dXMMXxl;,,,;..
         ..;;:;,.           ..;:cc:,.
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_tengkorak () {

	echo "
clear; echo -e '$convert_color_text
                   ...,,...
                ,lddddddddddl,.
              ;dddddddddddddddd:
             cddddddddddddddddddl
            .dddddddddddddddddddd;
            ,dl;;clddddddddoc:;cd:
            .ol.    .oddd;.    ;d.
             cdd;...;dood:...,odl
      ....  ;ddddddddc. ;dddddddd,  ...
    .lddddl  ,cldddddl;;cdddddol; .odddd;
   .odddddd:.  .ddl.dd.:dd.odd.  .cddddddc.
   ;dddddddddl;.... ,;..;, ....;lddddddddd.
    .......,cddddl;.      .:lddddc,....;,.
              .;lddddl;:lddddc,.
                 .ldddddddd;.
             ..:oddddl;;lddddc,.
    .;;....:oddddc;.      .;ldddoc,....,.
   cdddddddddc,.              .;lddddddddd.
   .odddddd:.                    .cddddddo.
     lddddo                       .dddddl
      ....                         ..,,.
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_headtengkorak () {

	echo "
clear; echo -e '$convert_color_text
                 ..;:cllc:;..
             .:oxOOOOOOOOOOOOxo:.
          ;okOOOOOOOOOOOOOOOOOOOOko;
       .lkOOOOOOOOOOOOOOOOOOOOOOOOOOkl.
      :kOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOk:
    .xOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOx.
    xOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOx.
   lOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOl
  .OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO.
  ,OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO,
  .OOOkc;;:coxOOOOOOOOOOOOOOOOOOxoc:;;:xOOO.
   xOOx        .;okOOOOOOOOOd:..       lOOx
   .kOOd.         .oOOOOOOx.          lOOk.
    ;OOOkl.       .dOOOOOOk,        :kOOO;
   .dOOOOOkl;.,;lxOOOOddOOOOko:,.,ckOOOOOx.
  .kOOOOOOOOOOOOOOOOk:  ,kOOOOOOOOOOOOOOOOk.
  .OOOOOOOOOOOOOOOOo.    .lOOOOOOOOOOOOOOOO.
   ,kOOOOOOOOOOOOOOd;,...;oOOOOOOOOOOOOOOk,
     ,:loxOOOOOOOOOOOOOOOOOOOOOOOOOOxol:,
        .xOOOOd..dOOOd..dOOOd..dOOOOx.
        .OOOOOk  kOOOk  kOOOk  kOOOOO.
         .lxkOk..kOOOk..kOOOk..kOkxl.
            ..   .:c:.  .:c:.   ..
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_questmask() {

	echo "
clear; echo -e '$convert_color_text
                 ..;:cllc:;..
              .lONWMMMMMMMMWNOl.
           .oKWMMMMMMMMMMMMMMMMWKl.
          :NMMMMMMMMMMMMMMMMMMMMMMX,
         ,WMMMMMMMWkc,..,cOWMMMMMMMX.
         dMMMMMMMW:        dMMMMMMMM:
         :dddddddc         ;MMMMMMMMc
                           dMMMMMMMM,
                         .xWMMMMMMWd
                       .xWMMMMMMMNc
                     .xWMMMMMMMXl.
                    oWMMMMMMMXc
                   xMMMMMMMXo.
                  :MMMMMMMK.
                  xMMMMMMW;
                  :ddddddo.

                      .
                  ;kKNWN0o.
                 lMMMMMMMMX.
                 oMMMMMMMMN.
                  lXMMMMWO.
                   .cdxo,
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_quester () {

	echo "
clear; echo -e '$convert_color_text
                     .lxxo;.
                   .xWMMMMMK;
                   dMMMMMMMMN.
                   lWMMMMMMMK.
                    ,d0XX0xc.


                    oOOOO0Ok.
                   .XMMMMMM0.
                  .OMMMMMMMo
                .oXMMMMMMMO.
              .cXMMMMMMMNo
            .lXMMMMMMMNo.
           ,XMMMMMMMWk.
          :WMMMMMMMO.
         .NMMMMMMM0.
         .MMMMMMMMx         ;OOOOOOOx.
         .WMMMMMMMX.       .KMMMMMMM0
          dMMMMMMMMNxc:;:lkNMMMMMMMMc
           dWMMMMMMMMMMMMMMMMMMMMMWl
            .dXMMMMMMMMMMMMMMMMW0o.
               .lOKNWMMMMMWXKxc.
                   .,,::;,..
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function text_love () {

	echo "
clear; echo -e '$convert_color_text
       ..........             .........
    ...,,,,,,,,,,..        ..,,,,,,,,,,...
   .,,,,,,,,,,,,,,,..    ..,,,,,,,,,,,,,,,.
  .,,,,,,,,,,,,,,,,,,....,,,,,,,,,,,,,,,,,,.
 .,,,,,,,,,,,,,,,,,,,,..,,,,,,,,,,,,,,,,,,,,.
 .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
 .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..
 .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
 .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..
  ..,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..
   ..,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,...
     ...,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..
        ...,,,,,,,,,,,,,,,,,,,,,,,...
           ...,,,,,,,,,,,,,,,,,...
               ..,,,,,,,,,,,,..
                 ..,,,,,,,,..
                   ...,,...
                     ....
                      ..
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_world () {

	echo "
clear; echo -e '$convert_color_text
              ...,,;::::::;,,...
           .,::::::::oxxlc::::::c;..
        .,:::::::::ck00000x:cdkkO0O0x:
      .;cxOkc:::::lk0OO00kok0000000000O:
    .;::::c::::::k00klO00000000000000000k.
   .:::::::::lxc:odkx:dO00000000000000000O,
  .:::::::::ckOxcoOkxk000000000000000000000;
  :::::::::::cokO000000000000000000000000000.
 .:::::::::::loOOkkkk00OoxdO0000000000000000c
 ,:::::::::::dOkllllodxdkO000000000000000000x
 ;::::::::::ck00000xoddood000000000000000000k
 ,:::::::::o0000000000000kO00Odxxxk000000000x
 .:::::::::O00000000000000kk00Oxc::cO00xllk0:
  ;::::::::d000000000000000Okxc:::::lOo::::x.
  .:::::::::coollox000000000Oo::::::::::::;.
   .;:::::::::::::lO0000000o:::::::::::::;.
     ,:::::::::::::d0000000l:l::::::::::,
      .;:::::::::::d000000dckx::::::::;.
        .,:::::::::cO0000kccxc::::::,.
           ..;::::::dOOkl:::::::;..
               ...,,;;;;;;,,...
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_worldnet () {

	echo "
clear; echo -e '$convert_color_text
               .:dk0XNNNNX0kd:.
           .cxKWW0OWNo..oNWO0WWKxc.
        .cOO0NNx,.0K.    .00..xXN0OOc.
      .dKd,dXo.  OK.      .K0  .oXx,oKd.
    .xKl..Kk.   :N:        ,Nc   .kK..oKo.
   :N0,..KO.....OO..........kO.....kK..:KX,
  lXxddkWKdddddOWkddddddddddkWOddddd0WOddkX:
 lW:   oW.     cK.           Kc     .Wo   lN:
,Nd   .Xk      dk            kx      x0    OK.
xX.   cM:      Od            dO      :W,   :Wl
Kk    dN.     .0o            oK.     .Xc   .Kk
XXxxxxXWOxxxxxkNKxxxxxxxxxxxxKNkxxxxxOWKxxxkN0
KK....kWc.....,Kk............xK,.....:No...:Nk
dN.   cMc      kx            dO      :N.   cMc
.Xk   .KO      oO            kd      kO   .KO.
 :Nl   cW:     :X.          .K:     ,Wc   xX.
  :Xo..,00,....:Nl..........lNc.....O0:.,xK.
   .KMKxdKWOddddKNkddddddddxNKddddOWKdxXMO.
    .l0x,.k0:   :Wc        cN:   :0O.,xO:
       ,k0ll00:  dN:      :Nd  :00ll0k,
         .lO0NMXo,xNl    cNx,oXMN0Oo.
            .:okXWNWMKoo0MWXWXko:.
                .,cokO00Okdc,.
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_penguin () {

	echo "
clear; echo -e '$convert_color_text
                    .....
                ..............
              ..................
            ....coc,......,coc....
           ...:XMWMNo....oNMWMX:...
           ...XMx,:NMo..lMN:,xMX...
           ..;MMd.,XKxddxKX,.dMM;..
           ..:MMMXW0kkxxkkKWXMMM:..
          ...oMMMMMWkdxxdOWMMMMMo...
       ......OMMMMMMWX00XWMMMMMMO......
    ........:WMMMMMMMMMMMMMMMMMMW:........
  ..........0MMMMMMMMMMMMMMMMMMMM0..........
 ..........dMMMMMMMMMMMMMMMMMMMMMMd..........
.....   ..,XMMMMMMMMMMMMMMMMMMMMMMX...   .....
 ..     ..;MMMMMMMMMMMMMMMMMMMMMMMM;..     ..
        ..,WMMMMMMMMMMMMMMMMMMMMMMW,..
        ...OMMMMMMMMMMMMMMMMMMMMMMO...
         ..;KMMMMMMMMMMMMMMMMMMMMK,..
           .,OMMMMMMMMMMMMMMMMMMO,.
            ..cONMMMMMMMMMMMMNkc..
              .:.cdk0KKKK0kdc.:.
           ....d..............d....
          ,,,,,,,,,,.    .,,,,,,,,,,
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_maskalien () {

	echo "
clear; echo -e '$convert_color_text
                 ...........
             ....,,,,,,,,,,,,,...
          ..,,,,,,,,,,,,,,,,,,,,,,..
        ..,,,,,,,,,,,,,,,,,,,,,,,,,,..
       .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
      .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
     .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
    .,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,.
    .,,,,.,,,,,,,,,,,,,,,,,,,,,,,,,..,,,,.
    .,,,.   ....,,,,,,,,,,,,,,...    ,,,,.
    .,,,.        ..,,,,,,,,..        .,,,.
     .,,.          ..,,,,.          .,,,.
      .,,.           .,,.           .,,.
       .,,.          .,.          ..,,.
        .,,,..       .,.       ...,,,.
         .,,,,,,.....,,,,.....,,,,,,.
          .,,,,,,,,,,,,,,,,,,,,,,,,.
           ..,,,,,,,,,,,,,,,,,,,,,.
             ..,,,,,.....,,,,,,,.
               .,,,,.....,,,,,.
                 .,,,,,,,,,,..
                   ..,,,,...
                      ...
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;}

function jp_text_maskanonymous () {

	echo "
clear; echo -e '$convert_color_text
            .,cdkO0XNNXKKKKKK0Oxoc:..
        :xKWMMMMMMMMMMMMMMMMMMMMMMMMW0l.
      .kWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK.
      lWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK.
     .XMMMMWNNNWWMMMMMMMMMMMMMMWNXXNWMMMWx
     :WMXxoc,....:oKMMMMMMMW0l,....:lokWMN.
     xMNKNWNOxo:... cNMMMMO. ...cdkKWWX0NW,
     KMMMMMMMMMWO:.,oNMMMMO:,.lXMMMMMMMMMW:
    .XMMMMWX00KXWWK:cXMMMM0:kNWNK0O0XWMMMMo
    .NMWO:.     .:xk ,WMMMNNXo,      .cXWMd
    .WW:.....,,,,:lx  XMMMMM0lcooll::cldkOo
    .XWXWMMMMMMMMMMk .NMMMMMMMMMMMMMMMMMMMd
     lNMMMMMMMMMMMMo .NMMMMMMMMMMMMMMMMMMW:
      :NMMMMMMMMMMN. .XMMMMMMMMMMMMMMMMMWk
      l.o0KKK0O0Kl.  .NMMMMKkXWWWWWWWNXxd.
      :d.c.o0XNWo oo lMMMMMMNxWWKkko.,:.d
       xxcc c0WMW0Nx.OMMMMWMMMMMWWd.:0,k.
        dKc:. .:okOl .cdl,,kNNKkl. cx:0:
         lXc,ol,.     dXl       .ck::K:
          :Nx.,xXNKOk0K0OxodkOKNWNld0.
           .00. xKKKK0KKKXWMMMMMNdKx.
             x0,XMMMWk.  cNMMMM0kX:
              ck0WMMMO   OMMMMWXK.
               .OWMMW. . :WMMMWo
                .oNMW:   lWMW0.
                  .dKO   KNk,
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}

function jp_text_anonymous() {

	echo "
clear; echo -e '$convert_color_text
          .        .xKNX0l        .
       .xl        xMM0dxNMN.       l0:
    .:dW:         ::    xMMd        :Nxl:
   .X:xl.             :0MNl         .ox:N:
  :dkl0c             kMMc            ,0dkkl.
 lxdKd,              ...              ,l0dxd.
 O0:lK.              KWK              .0d,O0.
.oXoX.                                 .O0Kd..
d.0K:,             :.:V:.:             .cxX.k.
xk:,X.         :cdKN  V  0Xxl:.         K:,xO.
:M:0k         0MMMMK  V  dMMMMM.        oWlMc.
.dKW,c       ,MMMMMW  V  KMMMMMx       l.NXo..
ll:K.N       kMMMMMM: V :MMMMMMN       0:x:ld
.K0::M.     .WMMMMMMM0M0WMMMMMMM,     .Xo:K0.
 .dNkW,k.   ,MMMMMMMMMMMMMMMMMMMl   .0.WONo.
  c,lKooK   cMMMMMMMMMMMMMMMMMMMk   kOc0c:o
   o0ol.Nl,.dMMMMMMMMMMMMMMMMMMM0 ::W:ldKo
    .dNNOX:KxKMMMMMMMMMMMMMMMMMNkX:X0NKd.
     .:oooo,kKKNMMMMMMMMMMMMMWX0O:odooc.
       .oOXXKxoKMMMMMMMMMMMMMNloO00ko.
         .:lld0MMMMMMMMMMMMMMMNOddc.
           .,,:WMMMMMMMMMMMMMM:...
              .MMMMMMMMMMMMMMM:
\e[0m'$add_lolcat
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
}



function input_color_text () {

	while true; do
		clear;
		echo -e "	\e[0m*PILIH WARNA UNTUK GAMBAR TEKS*";
		echo -e "
 $no($ccyan 1 $no) none
 $no($ccyan 2 $no)\e[0;31m red
 $no($ccyan 3 $no)\e[1;31m light_red
 $no($ccyan 4 $no)\e[0;32m green
 $no($ccyan 5 $no)\e[1;32m light_green
 $no($ccyan 6 $no)\e[0;33m orange
 $no($ccyan 7 $no)\e[0;34m blue
 $no($ccyan 8 $no)\e[1;34m light_blue
 $no($ccyan 9 $no)\e[0;35m purple
 $no($ccyan 10 $no)\e[1;35m light_purple
 $no($ccyan 11 $no)\e[0;36m cyan
 $no($ccyan 12 $no)\e[1;36m light_cyan
 $no($ccyan 13 $no)\e[0;37m light_gray
 $no($ccyan 14 $no) dark_gray (font sulit di lihat)
 $no($ccyan 15 $no)\e[1;33m yellow
 $no($ccyan 16 $no)\e[1;37m white";
     	echo -e " $no($ccyan 17 $no) rainbow (warna acak)"; echo -e "\e[0m";
		declare -A color_array_text=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
	     echo -e "\e[1;37m[E] example : color > 12\e[0m";
	     echo -en "color > "; read user_color_text; echo;
		convert_color_text="${color_array_text["${user_color_text:-none}"]}";
		if [ "$user_color_text" == "" ]; then
			echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1;
		elif [ "$user_color_text" == "17" ]; then
			lolcat_installer; clear;
			add_lolcat=" | lolcat -a -d 1"; clear; break;
		elif [ -v color_array_text["${user_color_text}"] ]; then
			clear; break;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
		fi;
	done;
}





function main_text_logo () {

	while true; do
		clear;
		echo -e "		\e[1;36m[\e[1;32m0\e[1;36m]\e[1;34m.\e[1;31mEXIT\e[0m\n";
		echo -e "\e[1;34m[\e[1;36m1\e[1;34m]\e[1;37m.Hacker logo symbol\e[0m	\e[1;34m[\e[1;36m7\e[1;34m]\e[1;37m.Bumi bulat\e[0m"
		echo -e "\e[1;34m[\e[1;36m2\e[1;34m]\e[1;37m.Tengkorak\e[0m		\e[1;34m[\e[1;36m8\e[1;34m]\e[1;37m.Internet\e[0m"
		echo -e "\e[1;34m[\e[1;36m3\e[1;34m]\e[1;37m.Kepala tengkorak\e[0m	\e[1;34m[\e[1;36m9\e[1;34m]\e[1;37m.Pinguin\e[0m"
		echo -e "\e[1;34m[\e[1;36m4\e[1;34m]\e[1;37m.Tanda tanya\e[0m		\e[1;34m[\e[1;36m10\e[1;34m]\e[1;37m.Mask alien\e[0m"
		echo -e "\e[1;34m[\e[1;36m5\e[1;34m]\e[1;37m.Tanda Tanya kebalik\e[0m	\e[1;34m[\e[1;36m11\e[1;34m]\e[1;37m.Mask Anonymous\e[0m"
		echo -e "\e[1;34m[\e[1;36m6\e[1;34m]\e[1;37m.Love\e[0m		\e[1;34m[\e[1;36m12\e[1;34m]\e[1;37m.Anonymous\e[0m\n"
		declare -A function_array_text=(["1"]="jp_text_crml" ["2"]="jp_text_tengkorak" ["3"]="jp_text_headtengkorak" ["4"]="jp_text_questmask" ["5"]="jp_text_quester" ["6"]="text_love" ["7"]="jp_text_world" ["8"]="jp_text_worldnet" ["9"]="jp_text_penguin" ["10"]="jp_text_maskalien" ["11"]="jp_text_maskanonymous" ["12"]="jp_text_anonymous");
		echo -en "pilih > "; read input_menu_text;
		convert_execute_text="${function_array_text["${input_menu_text}"]}";
		if [ -v function_array_text["${input_menu_text}"] ]; then
			cd $HOME;
			if [ -f .bashrc ]; then
				input_color_text; main_pwd; main_date;
				find_bashrc_home; create_file_bashrc;
				$convert_execute_text; failed_create_file; break;
			else
				input_color_text; create_file_bashrc; main_pwd; main_date;
				$convert_execute_text; failed_create_file; break;
			fi;
		else
			echo -e "\e[1;31m[X]oopss, tidak ada menu!"; sleep 1
		fi;
	done;
}
















function logo_display_termux () {

echo -e '\e[1;36m
___________________
\________________  \\__________________
                 \\___________________/\e[1;34m
  ______                      _ __
 /_  __/___ _____ ___  ____  (_) /___ _____
  / / / __ `/ __ `__ \/ __ \/ / / __ `/ __ \
 / / / /_/ / \e[1;31m/ / / / / /_/ / / / /_/ / / / /
/_/  \__,_/_/ /_/ /_/ .___/_/_/\__,_/_/ /_/
                   /_/\e[0m\e[1;31m
        ______                         _  __
       /_  __/__  _________ ___  __  _| |/ /
        / / / _ \/ ___/ __ `__ \/ / / /   /
       \e[1;34m/ / /  __/ /  / / / \e[1;31m/ / / /_/ /   |\e[1;34m
      /_/  \___/_/  /_/ /_/ /_/\__,_/_/|_|\e[1;36m
        _________________
       /_______________  \\______________________
                       \\_______________________/
'
}



function logo_help () {

echo -e "\e[1;36m
.oo'   .oc..llllll.,c.   .:cc:'
.OM0.  .0Mc.0MMMMMx,X0.   lWMMW0,
 ,NMc   ,N0.:WNc;;,.oMd    xNc;oKc
  xMO    xMd.xMo.....ON,   .K0. :N:
  ;WWl,,;oWN;.KXllll..KO.   :Wx..KN'
   xMMMMMMMMk.cMMMMMk.\e[1;34mcWd    oWNWMMl
   'XMXOkkkNWc.0MOc:;..OW:    kMKxo..
    dMK....lWX'cWX.... ,NK.   .KK...
    ,WMl.  .0Md.xMo.   .cWO;;;::Xd
     kM0.   :WN'.KNO0KX0'xMMMMMxoWc
     :WMo   .kMx.lMMMMWNd,OOkxdo':;.
     .OMX'   'dl..:;,'..............
      .'..    ...........
       ...
\e[0m"
}



function lan_nue () {

	   echo -e "\e[25?l\n\n##TEKAN ENTER UNTUK MELANJUTKAN##";
	   read -sp "" en_ter;
	   echo -en "\e[25?h";
}



function out_low () {

	local string="$1";
	local length=${#string};
		echo -en "\e[25?l";
	for ((i=0; i<length; i++)); do
		echo -en "${string:i:1}";
	     sleep 0.1;
	done;
	echo;
}




function user_connection () {

        local loops_yesno=true;

        while $loops_yesno; do
                clear;
                echo -e "\e[1;31m[X] gagal menginstall package yang dibutuhkan!\e[0m";
                echo -e "\e[1;33m[i] harap periksa kembali koneksi internet anda!\e[0m\n";
                echo -e "$no[ \e[1;32m1$no ] \e[1;32mCoba Lagi\e[0m $no[ \e[1;36m2$no ] \e[1;36mBANTUAN\e[0m $no[ \e[1;31m3$no ] \e[1;31mBatalkan\e[0m\n";
                echo -en "Pilih > "; read dont_know_user;
                if [ "$dont_know_user" == "1" ]; then                                                                         clear; break;
                	return 1; break;
	           	elif [ "$dont_know_user" == "2" ]; then
	           		while true; do
		               	clear; logo_help;
		               	echo -e "\n\e[1;33m[i] Untuk menginstall package yang dibutuhkan \e[0m: \n";
		                echo -e "$no[$clgreen+$no] \e[32mPastikan anda mempunyai kouta (internet)!";
						echo -e "$no[$clgreen+$no] \e[32mdata seluler harus diaktifkan!";
						echo -e "$no[$clgreen+$no] \e[32mPastikan internet anda stabil!";
						echo -e "$no[$clgreen+$no] \e[32mRuang penyimpanan internal anda harus cukup!";
						echo -e "$no[\e[1;34m+$no] \e[1;36mJika tetap tidak bisa atau tidak mengerti";
						echo -e "anda bisa menghubungi XklienZ melalui Facebook \e[1;37m:\n\e[0m\e[4;34mhttps://m.facebook.com/XklienZ\e[0m\n";
			            echo -e "$no[ \e[1;32m1$no ] \e[1;32mCoba Lagi\e[0m $no[ \e[1;36m2$no ] \e[1;36mHUBUNGI XZ\e[0m $no[ \e[1;31m3$no ] \e[1;31mExit\e[0m\n";
						read -p "pilih > " user_input_help;
						if [ "$user_input_help" == "1" ]; then
							return 1; break;
						elif [ "$user_input_help" == "2" ]; then
							report_xz="$(am start -n com.android.chrome/com.google.android.apps.chrome.Main -d "https://m.facebook.com/XklienZ" 2>&1 > /dev/null)";
							if [ -z "$report_xz" ]; then
								echo -e "\e[25?h"; exit 1;
							else
								echo -e "\e[25?h\e[0m\e[1;31m[X] gagal memghubungi XklienZ, karena apk chrome tidak bisa di buka atau tidak terinstall di ponsel anda!\e[0m";
								exit 1;
							fi;
						elif [ "$user_input_help" == "3" ];then
							exit 1;
						else
							echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
						fi;
					done;
	               elif [ "$dont_know_user" == "3" ]; then
	               	echo -e "\e[1;33m[K] anda memilih untuk membatalkanNya (keluar)\e[0m\e[25?h\n"; sleep 1.5; exit 1;
	               else
					echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
					loops_yesno=true;
			fi;
        done;
}



function lolcat_installer () {
	#Install lolcat
	while true; do
		clear;
		if command -v lolcat &> /dev/null; then
			clear; break;
		else
			pkg update && pkg upgrade;
			pkg install ruby;
			gem install lolcat;
			if command -v lolcat &> /dev/null; then
				clear; break;
			else
				user_connection;
			fi;
		fi;
	done;
}



function message_save () {

	clear; echo -e "\e[1;32m[Z] tampilan awal termux sudah di set\e[0m"; sleep 1;
     echo -e "\e[1;33m\a[i] harap buka NEW SESSION ATAU login ulang termux!\e[0m\e[25?h"; sleep 1
	exit 0;
}



function find_bashrc_home () {

	cd $HOME
	while true; do
		if [ -f .bashrc ]; then
               clear;
               echo -e "\e[1;34mfile .bashrc ditemukan..\n";
               echo -e " \e[1;32m[\e[1;36m1\e[1;32m]\e[0m.\e[1;36mGanti nama file  \e[1;32m[\e[1;36m2\e[1;32m]\e[0m.\e[1;36mHapus\e[0m\n";
               echo -en "pilih > "; read up_to_bashrc;
               if [ "$up_to_bashrc" == "1" ]; then
                    rename_example_figlet; rename_bashrc_figlet;
                    function_view_figlet;
               elif [ "$up_to_bashrc" == "2" ]; then
                    rm -f .bashrc; break;
               else
                    echo -e "\e[1;31m[X] oopss, tidak ada pilihanyang tepat!\e[0m"; sleep 1
               fi;
          else
               break; return 0;
          fi;
     done;

}



function rename_example_figlet () {

	   clear;
	   echo -e "\e[1;33m[i] usahakan nama filenya yang belum pernah ada di file sebelumNya ya..\n"; sleep 0.10;
	   echo -e "\e[1;36m[L] lihat contoh dibawah ini!!\n"; sleep 0.10;
	   echo -e "\e[1;36m[E] example"; sleep 0.10;
	   echo -en "Rename : \e[1;36m"; sleep 1; out_low "-old-1"; sleep 0.10;
	   echo -e "\e[0m\e[25h\n\n";
	   lan_nue;
}



#function rename file .bashrc user
function rename_bashrc_figlet () {

	local loops_rename_figlet=true;

	while $loops_rename_figlet; do
      		clear; cd $HOME;
      		echo -e "	$no*RENAME FILES*\n";
      		echo -en "\e[25?hRename : "; read name_bashrc_figlet;
      		if [ "$name_bashrc_figlet" == "" ]; then
		          echo -e "\e[1;31m\a[X] harus di isi!\e[0m\e[0m";
		     	echo -e "\e[1;33m[i] karena ini terkait dengan file anda!\e[0m"; sleep 3
		          loops_rename_figlet=true;
			elif [ -f .bashrc$name_bashrc_figlet ]; then
                	echo -e "\e[1;31m[X] sudah ada nama file seperti itu!\e[0m"; sleep 2;
				loops_rename_figlet=true;
			else
                	clear; break;
			fi;
	done;

	cd $HOME;
	if [ -f .bashrc ]; then
		mv .bashrc ".bashrc$name_bashrc_figlet";
		cd $HOME;
		echo -e "\e[1;32m[Z] Berhasil Mengganti nama file .bashrc menjadi .bashrc$name_bashrc_figlet\e[0m"; lan_nue;
	else
		echo -e "\e[1;31m[X] Kesalahan tidak diketahui, file .bashrc tidak ditemukan!\e[0m"; sleep 2
		exit 1
	fi
}



function function_view_figlet () {

	local loops_view_figlet=true;

 	while $loops_view_figlet; do
		clear;
		echo -e "\n\e[1;33m[i] file yang telah anda rename ada di direktori :";
 		echo -e "\e[1;36m/data/data/com.termux/files/home/.bashrc$name_bashrc_figlet\e[0m";
		read -p "apakah anda ingin melihatNya? y/n " view_bashrc_figlet;
 		if [ "${view_bashrc_figlet,,}" == "y" ]; then
         		clear; cd $HOME; ls -a;
			echo -e "\n\nFile yang anda rename : .bashrc$name_bashrc_figlet";
			lan_nue;
			break;
		elif [ "${view_bashrc_figlet,,}" == "n" ]; then
			break;
		else
			echo -e "\e[1;31m\a[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
			loops_view_figlet=true;
		fi;
 	done;
}



function failed_create_file () {

	while true; do
		if [ -f ~/.bashrc ]; then
 	    	message_save; exit 0;
		else
			clear; sleep 2; echo -e "
\e[1;31m**   **	\e[1;31m[X] GAGAL MEMBUAT FILE!\e[0m
\e[1;31m ** **	\e[1;31mKESALAHAN TIDAK DIKETAHUI\e[0m
\e[1;31m  ***	\e[0mJika terus gagal membuat file, anda
\e[1;31m  ***	\e[0mbisa hubungi XklienZ melalui facebook :
\e[1;31m ** **	\e[0mhttps://m.facebook.com/XklienZ
\e[1;31m**   ** \e[0m
";
			echo -e "\n\e[0m[\e[1;36m1\e[0m].\e[1;34mHubungi	\e[0m[\e[34m2\e[0m].\e[1;36mTidak\n\n";
			echo -en "\e[0mpilih > "; read contact_xz;
			if [ "$contact_xz" == "1" ]; then
				echo -e "\e[25?l";
				report_xz="$(am start -n com.android.chrome/com.google.android.apps.chrome.Main -d "https://m.facebook.com/XklienZ" 2>&1 > /dev/null)";
				if [ -z "$report_xz" ]; then
					exit 1;
				else
					echo -e "\e[25?h\e[0m\e[1;31m[X] gagal memghubungi XklienZ, karena apk chrome tidak bisa di buka atau tidak terinstall di ponsel anda!\e[0m";
					exit 1;
				fi;
			elif [ "$contact_xz" == "2" ]; then
				exit 1;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1
			fi;
		fi;
	done
}




function run_color_figlet () {

	echo -e "	\e[25?h\e[0m*PILIH WARNA*";
	echo -e "
 $no($ccyan 1 $no) none
 $no($ccyan 2 $no)\e[0;31m red
 $no($ccyan 3 $no)\e[1;31m light_red
 $no($ccyan 4 $no)\e[0;32m green
 $no($ccyan 5 $no)\e[1;32m light_green
 $no($ccyan 6 $no)\e[0;33m orange
 $no($ccyan 7 $no)\e[0;34m blue
 $no($ccyan 8 $no)\e[1;34m light_blue
 $no($ccyan 9 $no)\e[0;35m purple
 $no($ccyan 10 $no)\e[1;35m light_purple
 $no($ccyan 11 $no)\e[0;36m cyan
 $no($ccyan 12 $no)\e[1;36m light_cyan
 $no($ccyan 13 $no)\e[0;37m light_gray
 $no($ccyan 14 $no) dark_gray (font sulit di lihat)
 $no($ccyan 15 $no)\e[1;33m yellow
 $no($ccyan 16 $no)\e[1;37m white";
	echo -e " $no($ccyan 17 $no) rainbow (warna acak)"; echo -e "\e[0m";
}


function font_figlet () {

	echo -e "
 $no($ccyan 2 $no) big
 $no($ccyan 3 $no) block
 $no($ccyan 4 $no) bubble
 $no($ccyan 5 $no) digital
 $no($ccyan 6 $no) livrit
 $no($ccyan 7 $no) lean
 $no($ccyan 8 $no) mini
 $no($ccyan 9 $no) mnemonic
 $no($ccyan 10 $no) script
 $no($ccyan 11 $no) shadow
 $no($ccyan 12 $no) slant
 $no($ccyan 13 $no) small
 $no($ccyan 14 $no) smscript
 $no($ccyan 15 $no) smshadow
 $no($ccyan 16 $no) smslant
 $no($ccyan 17 $no) term
\e[0m";
}



function main_date () {

	while true; do
		clear; echo -e "\e[0m	+WARNA UNTUK DATE>HOME+";
		run_color_figlet;
		declare -A date_array_c=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		echo -e "\e[1;37m[E] example : color > 12\e[0m";
		echo -en "color > "; read date_color;
		user_date_c="${date_array_c["${date_color:-none}"]}";
		if [ "$date_color" == "" ]; then
			echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1;
			elif [ -v date_array_c["${date_color:-none}"] ]; then
				uc_date="echo -en '\e[1;32m📆~> $user_date_c'"
				u_date='echo -e "''$(date)''\e[0m"; echo';
				break;
			elif [ "$date_color" == "17" ]; then
				lolcat_installer;
				lct_date='echo -en "\e[1;32m📆~> \e[0m"; echo "''$(date)''" | lolcat -a -d 1; echo';
				break;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
		fi;
	done;
}



function main_pwd () {

	while true; do
		clear; echo -e "\e[0m	+WARNA UNTUK PWD>HOME+";
		run_color_figlet;
		declare -A pwd_array_c=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		echo -e "\e[1;37m[E] example : color > 12\e[0m";
		echo -en "color > "; read pwd_color;
		user_pwd_c="${pwd_array_c["${pwd_color:-none}"]}";
		if [ "$pwd_color" == "" ]; then
			echo -e "\e[1;31m[X] oopss, harus di isi!\e[0m"; sleep 1;
			elif [ -v pwd_array_c["${pwd_color:-none}"] ]; then
				uc_pwd="echo -en '\e[1;32m📁~> $user_pwd_c'";
				u_pwd='echo -e "''$(pwd)''\e[0m"';
				direc_ctn1="echo -en '\e[1;32m📂~> \e[0mDirectory Contens\e[1;32m => $user_pwd_c'";
				direc_ctn2='echo -e "''$(ls -A | wc -l)''🗂\e[0m"';
				break;
			elif [ "$pwd_color" == "17" ]; then
				lolcat_installer;
				lct_pwd='echo -en "\e[1;32m📁~> \e[0m"; echo "''$(pwd)''" | lolcat -a -d 1';
				lct_direc='echo -en "\e[1;32m📂~> \e[0m"; echo -en "Directory Contens" | lolcat -a -d 1; echo -en "\e[1;32m => \e[0m"; echo "$(ls -A | wc -l)🗂" | lolcat -a -d 1';
				break;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
		fi;
	done;
}



function create_file_bashrc () {

	cd $HOME; touch .bashrc
	while true; do
		if [ -f ~/.bashrc ]; then
 	    		break;
		else
			mv .bashrc$replace_bashrc_figlet .bashrc
			clear; sleep 2; echo -e "
\e[1;31m**   **	\e[1;31m[X] GAGAL MEMBUAT FILE!\e[0m
\e[1;31m ** **	\e[1;31mKESALAHAN TIDAK DIKETAHUI\e[0m
\e[1;31m  ***	\e[0mJika terus gagal membuat file harap,
\e[1;31m  ***	\e[0mhubungi XklienZ melalui facebook :
\e[1;31m ** **	\e[0mhttps://m.facebook.com/XklienZ
\e[1;31m**   ** \e[0m
";
			echo -e "\n\e[0m[\e[1;36m1\e[0m].\e[1;34mHubungi	\e[0m[\e[34m2\e[0m].\e[1;36mTidak\n\n";
			echo -en "\e[0mMASUKAN : "; read contact_xz;
			if [ "$contact_xz" == "1" ]; then
				echo -e "\e[25?l";
				report_xz="$(am start -n com.android.chrome/com.google.android.apps.chrome.Main -d "https://m.facebook.com/XklienZ" 2>&1 > /dev/null)";
				if [ -z "$report_xz" ]; then
					echo -e "\e[25?h"; exit 1;
				else
					echo -e "\e[25?h\e[0m\e[1;31m[X] gagal memghubungi XklienZ, karena apk chrome tidak bisa di buka atau tidak terinstall di ponsel anda!\e[0m";
					exit 1;
				fi;
			elif [ "$contact_xz" == "2" ]; then
				exit 1;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1
			fi;
		fi;
	done
}



function save_bashrc_figlet () {

		create_file_bashrc
		#save to .bashrc
		echo "
echo -e '"$var_color"'; clear; figlet -f $user_style -t "$usnme"; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc; #save to .bashrc end
}



function user_select_figlet () {

	#User input for figlet
	usnme_loops=true;

	while $usnme_loops; do
		clear; echo -e "\e[0m\e[25?h";echo -e "	*NAMA UNTUK FIGLET*";
		echo -en "$no[$cgreen 1$no-\e[1;32m4 $no] nama anda : "; read usnme; echo;
		if [ "$usnme" == "" ]; then
			echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			usnme_loops=true;
		else
			break;
		fi;
	done;

	#User select style for figlet
	local loops_style=true;

	while $loops_style; do
		     clear; echo -e "	\e[25?h\e[0m*FONT UNTUK FIGLET*";
		     echo -e "\e[1;36m
 $no($ccyan 1 $no) banner
 $no($ccyan 2 $no) big
 $no($ccyan 3 $no) block
 $no($ccyan 4 $no) bubble
 $no($ccyan 5 $no) digital
 $no($ccyan 6 $no) livrit
 $no($ccyan 7 $no) lean
 $no($ccyan 8 $no) mini
 $no($ccyan 9 $no) mnemonic
 $no($ccyan 10 $no) script
 $no($ccyan 11 $no) shadow
 $no($ccyan 12 $no) slant
 $no($ccyan 13 $no) small
 $no($ccyan 14 $no) smscript
 $no($ccyan 15 $no) smshadow
 $no($ccyan 16 $no) smslant
 $no($ccyan 17 $no) term
\e[0m";
		      declare -A style_array=(["1"]="banner" ["2"]="big" ["3"]="block" ["4"]="bubble" ["5"]="digital" ["6"]="ivrit" ["7"]="lean" ["8"]="mini" ["9"]="mnemonic" ["10"]="script" ["11"]="shadow" ["12"]="slant" ["13"]="small" ["14"]="smscript" ["15"]="smshadow" ["16"]="smslant" ["17"]="term");
		      echo -e "\e[1;37m[E] example : figlet > 16";
		      echo -en "$no[$cgreen 2$no-\e[1;32m4 $no] figlet > "; read user_figlet;
		      user_style="${style_array["${user_figlet:-none}"]}";
		      if [ "$user_figlet" == "" ]; then
				echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
				loops_style=true;
			     elif [ -v style_array["${user_figlet:-none}"] ]; then
			      	break;
			     else
			     	echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			         	loops_style=true;
		      fi;
	done;

	while $loops_style; do
		      clear; run_color_figlet;
		      declare -A user_array_c=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		      echo -e "\e[1;37m[E] example : color > 12\e[0m";
		      echo -en "$no[$cgreen 3$no-\e[1;32m4 $no] color > "; read user_color; echo;
		      var_color="${user_array_c["${user_color:-none}"]}";
			 if [ "$user_color" == "" ]; then
			      	echo -e "\e[1;31m\a[X] harus di isi!\e[0m"; sleep 1;
			      	loops_style=true;
				elif [ -v user_array_c["${user_color:-none}"] ]; then
						break;
				elif [ "$user_color" == "17" ]; then
						choice_rainbow;
				else
						echo -e "\e[1;31m\a[X] oopss, tidak ada menu!\e[0m"; sleep 1;
						loops_style=true;
		      fi;
	done;


	#show the user what he just did
	while $loops_style; do
	      clear; echo -e "$var_color"; figlet -f $user_style -t "$usnme";
	      echo -e "\e[0m";
	      echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
	      echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] Apakah anda ingin menggantiNya? y/n "; read user_replace;
	      #User changes the figlet
		if [ "${user_replace,,}" == "y" ]; then
			 user_select_figlet;
			 elif [ "${user_replace,,}" == "n" ]; then
			 	clear; main_pwd; main_date;
				if [ -f ~/.bashrc ]; then
					find_bashrc_home;
					save_bashrc_figlet;
					failed_create_file;
				else
					save_bashrc_figlet;
					failed_create_file;
				fi;
		 	else
				echo -e "\e[1;31m\a[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
			     loops_style=true;
		fi;
	done;
}



function choice_rainbow () {

#for rainbow user choice

	local loops_rainbow_cho=true;

	while $loops_rainbow_cho; do
		if [ "$user_color" == "17" ]; then
			lolcat_installer; clear;
			#show the user what he just did
			figlet -f "$user_style" -t "$usnme" | lolcat;
			echo -e "\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
			echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] Apakah anda ingin menggantiNya? y/n "; read user_replace_rainbow;

		#users no select rainbow
		else
        		return 0;
	     fi
	 	if [ "${user_replace_rainbow,,}" == "y" ]; then
	        	 user_select_figlet;
	        	 choice_rainbow;
		      elif [ "${user_replace_rainbow,,}" == "n" ]; then
				clear; main_pwd; main_date;
				if [ -f ~/.bashrc ]; then
					find_bashrc_home;
					create_file_bashrc;
					echo "
clear; figlet -f $user_style -t "$usnme" | lolcat -a -d 1; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
echo
" > /data/data/com.termux/files/home/.bashrc;
					failed_create_file;
				else
					create_file_bashrc;
					echo "
clear; figlet -f $user_style -t "$usnme" | lolcat -a -d 1; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
echo
" > /data/data/com.termux/files/home/.bashrc;
					failed_create_file;
				fi;
		      else
			 	echo -e "\e[1;31m\a[X] tidak ada pilihan yang tepat!\e[0m"; sleep 1;
		        	loops_rainbow_cho=true;
	 	fi;
	done;
}



function users_select_cowsay () {

	loops_cowsay_1=true;

	while $loops_cowsay_1; do
		clear; echo -e "$no	*PILIH SALAH SATU FILE COWSAY*";
		echo -e "
 $no($ccyan 1 $no) bong               $no($ccyan 21 $no) luke-koala
 $no($ccyan 2 $no) bud-frogs          $no($ccyan 22 $no) mech-and-cow
 $no($ccyan 3 $no) bunny              $no($ccyan 23 $no) meow
 $no($ccyan 4 $no) cheese             $no($ccyan 24 $no) milk
 $no($ccyan 5 $no) cower              $no($ccyan 25 $no) moofasa
 $no($ccyan 6 $no) daemon             $no($ccyan 26 $no) moose
 $no($ccyan 7 $no) default            $no($ccyan 27 $no) mutilated
 $no($ccyan 8 $no) dragon-and-cow     $no($ccyan 28 $no) ren
 $no($ccyan 9 $no) dragon             $no($ccyan 29 $no) sheep
 $no($ccyan 10 $no) elephant-in-snake $no($ccyan 30 $no) skeleton
 $no($ccyan 11 $no) elephant          $no($ccyan 31 $no) stegosaurus
 $no($ccyan 12 $no) eyes              $no($ccyan 32 $no) stimpy
 $no($ccyan 13 $no) flaming-sheep     $no($ccyan 33 $no) three-eyes
 $no($ccyan 14 $no) ghostbusters      $no($ccyan 34 $no) turkey
 $no($ccyan 15 $no) head-in           $no($ccyan 35 $no) turtle
 $no($ccyan 16 $no) hellokitty        $no($ccyan 36 $no) tux
 $no($ccyan 17 $no) kiss              $no($ccyan 37 $no) vader-koala
 $no($ccyan 18 $no) kitty             $no($ccyan 38 $no) vader
 $no($ccyan 19 $no) koala             $no($ccyan 39 $no) www
 $no($ccyan 20 $no) kosh
";
		declare -A array_cowsay_one=(["1"]="bong" ["2"]="bud-frogs" ["3"]="bunny" ["4"]="cheese" ["5"]="cower" ["6"]="daemon" ["7"]="default" ["8"]="dragon-and-cow" ["9"]="dragon" ["10"]="elephant-in-snake" ["11"]="elephant" ["12"]="eyes" ["13"]="fllaming-sheep" ["14"]="ghostbusters" ["15"]="head-in" ["16"]="hellokitty" ["17"]="kiss" ["18"]="kitty" ["19"]="koala" ["20"]="kosh" ["21"]="luke-koala" ["22"]="mech-and-cow" ["23"]="meow" ["24"]="milk" ["25"]="moofasa" ["26"]="moose" ["27"]="mutilated" ["28"]="ren" ["29"]="sheep" ["30"]="skeleton" ["31"]="stegosaurus" ["32"]="stimpy" ["33"]="three-eyes" ["34"]="turkey" ["35"]="turtle" ["36"]="tux" ["37"]="vader-koala" ["38"]="vader" ["39"]="www");
		echo -e "\n\n[E] Example : cowsay > 30";
		echo -en "$no[$cgreen 1$no-\e[1;32m4 $no] cowsay > "; read input_cowsay_1;

		cowsay_users_1="${array_cowsay_one["${input_cowsay_1:-none}"]}";

		if [ "$input_cowsay_1" == "" ]; then
				echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1;
				loops_cowsay_1=true;
			elif [ -v array_cowsay_one["${input_cowsay_1:-none}"] ]; then
					clear; break;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
				loops_cowsay_1=true;
		fi;
	done;

	while $loops_cowsay_1; do
		clear; echo -e "	*MASUKAN PESAN UNTUK COWSAY*\n";
		echo -e "[E] Example : cowsay > Welcome To Terminal";
		echo -en "$no[$cgreen 2$no-\e[1;32m4 $no] cowsay > "; read sentence_cowsay;
		if [ "$sentence_cowsay" == "" ]; then
			echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1;
			loops_cowsay_1=true;
		else
			clear; break;
		fi;
	done;

	while $loops_cowsay_1; do
			clear; run_color_figlet;
	  	declare -A color_cowsay_1=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
		echo -en "$no[$clgreen 3$no-\e[1;32m4 $no] color : " ; read input_color_cowsay;
		cowsay_color_users="${color_cowsay_1["${input_color_cowsay:-none}"]}";
		if [ "$input_color_cowsay" == "" ]; then
				echo -e "\e[1;31m[X] harus di isi\e[0m"; sleep 1;
				loops_cowsay_1=true;
			elif [ -v color_cowsay_1["${input_color_cowsay:-none}"] ]; then
				clear; break;
			elif [ "$input_color_cowsay" == "17" ]; then
				cowsay_rainbow
			else
				echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
				loops_cowsay_1=true;
		fi;
	done;

	while $loops_cowsay_1; do
		echo -e "$cowsay_color_users"; clear; cowsay -f $cowsay_users_1 $sentence_cowsay;
		echo -e "\n\e[0m";
		echo -e "\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
		echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] Apakah anda ingin menggantiNya? y/n "; read cowsay_replace_1;
		if [ "${cowsay_replace_1,,}" == "y" ]; then
			users_select_cowsay;
		elif [ "${cowsay_replace_1,,}" == "n" ]; then
			clear; main_pwd; main_date;
			if [ -f ~/.bashrc ]; then
				find_bashrc_home;
	               create_file_bashrc;
				echo "
echo -e '"$cowsay_color_users"'; clear; cowsay -f $cowsay_users_1 $sentence_cowsay; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
	               failed_create_file;
			else
			create_file_bashrc;
			echo "
echo -e '"$cowsay_color_users"'; clear; cowsay -f $cowsay_users_1 $sentence_cowsay; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
					failed_create_file;
			fi;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
			loops_cowsay_1=true;
		fi;
	done;
}



function cowsay_rainbow () {

	local loops_cowsay_rainbow=true;

	while $loops_cowsay_rainbow; do
		lolcat_installer; clear;
		cowsay -f $cowsay_users_1 $sentence_cowsay | lolcat;
		echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
		echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] Apakah anda ingin menggantiNya? y/n "; read replace_rainbow_cowsay;
		if [ "${replace_rainbow_cowsay,,}" == "y" ]; then
				users_select_cowsay;
			elif [ "${replace_rainbow_cowsay,,}" == "n" ]; then
				clear; main_pwd; main_date;
				if [ -f ~/.bashrc ]; then
					find_bashrc_home;
					create_file_bashrc;
echo "clear; cowsay -f $cowsay_users_1 $sentence_cowsay | lolcat -a -d 1; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
					failed_create_file;
				else
					create_file_bashrc;
echo "clear; cowsay -f $cowsay_users_1 $sentence_cowsay | lolcat -a -d 1; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
					failed_create_file;
				fi;
			else
				echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
				loops_cowsay_rainbow=true;
		fi;
	done;

}



function main_neofetch () {

	loops_ntf=true;

	while true; do
		clear
		if command -v neofetch &> /dev/null; then
			break;
		else
			pkg update && pkg upgrade;
			pkg install neofetch;
			if command -v neofetch &> /dev/null; then
				break;
			else
				user_connection;
			fi;
		fi;
	done;

	while $loops_ntf; do
		clear;
		echo -e "\e[0m	*PILIH WARNA UNTUK NOEFETCH*\n";
		echo -e "	\e[1;32m[ \e[1;36m1 \e[1;32m]\e[1;37m.\e[1;36mdefault";
		echo -e "	\e[1;32m[ \e[1;36m2 \e[1;32m]\e[1;37m.\e[1;36mlolcat (Warna Acak)\e[0m";
		echo
		echo -en "$no[ \e[1;32m1$no-\e[1;32m1 $no] pilih > "; read ntf_color;
		if [ "$ntf_color" == "1" ]; then
			ntf_user='echo "''$(neofetch)''"';
			clear; main_pwd; main_date;
               if [ -f ~/.bashrc ]; then
				find_bashrc_home;
				create_file_bashrc;
echo "clear
$ntf_user
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
				failed_create_file;
				break;
			else
				create_file_bashrc;
echo "clear
$ntf_user
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
				failed_create_file;
				break;
			fi;
		elif [ "$ntf_color" == "2" ]; then
			lolcat_installer;
			ntf_lct_user='echo "''$(neofetch)''" | lolcat -a -d 1';
			clear; main_pwd; main_date;
               if [ -f ~/.bashrc ]; then
				find_bashrc_home;
				create_file_bashrc;
echo "clear
$ntf_lct_user
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
				failed_create_file;
				break;
			else
				create_file_bashrc;
echo "clear
$ntf_lct_user
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date
" > /data/data/com.termux/files/home/.bashrc;
				failed_create_file;
				break;
			fi;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_ntf=true;
		fi;
	done;
}



function main_toilet () {

	while true; do
		if command -v toilet &> /dev/null; then
			break;
		else
			pkg update && pkg upgrade;
			pkg install toilet;
			if command -v toilet &> /dev/null; then
				break;
			else
				user_connection;
			fi;
		fi;
	done;
	while true; do
		if command -v figlet &> /dev/null; then
			break;
		else
			pkg update && pkg upgrade;
			pkg install figlet;
			if command -v figlet &> /dev/null; then
				break;
			else
				user_connection;
			fi;
		fi;
	done;
	while true; do
		clear; echo -e "\e[0m\e[25?h	*MASUKAN NAMA ANDA*";
		echo -en "$no[$cgreen 1$no-\e[1;32m4 $no] nama anda : "; read username_toilet;
		if [ "$username_toilet" == "" ]; then
			echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1;
		else
			clear; break;
		fi;
	done;
	while true; do
		clear; echo -e "	*PILIH FONT*"; font_figlet;
	    	declare -A toilet_array=(["2"]="big" ["3"]="block" ["4"]="bubble" ["5"]="digital" ["6"]="ivrit" ["7"]="lean" ["8"]="mini" ["9"]="mnemonic" ["10"]="script" ["11"]="shadow" ["12"]="slant" ["13"]="small" ["14"]="smscript" ["15"]="smshadow" ["16"]="smslant" ["17"]="term");
		echo -e "[E] Example : pilih > 16";
		echo -en "$no[$cgreen 2$no-\e[1;32m4 $no] pilih > "; read input_font;
	     file_font_f="${toilet_array["${input_font:-none}"]}";
	     if [ "$input_font" == "" ]; then
	     	echo -e "\e[1;31m[X] harus di isi!\e[0m"; sleep 1;
	     elif [ -v toilet_array["${input_font:-none}"] ]; then
	     	clear; break;
	     else
	     	echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
	     fi;
	done;
	loops_toilet=true;
	loops_toilet2=true
	while $loops_toilet2; do
		clear;
		echo -e "\e[0m		*PILIH WARNA*\n"
		echo -e "	\e[1;32m[ \e[1;36m1 \e[1;32m]\e[1;37m.\e[1;36mDeafult";
		echo -e "	\e[1;32m[ \e[1;36m2 \e[1;32m]\e[1;37m.\e[1;36mRainbow (bukan lolcat)";
		echo -e "	\e[1;32m[ \e[1;36m3 \e[1;32m]\e[1;37m.\e[1;36mbiru&abu-abu";
		echo -e "	\e[1;32m[ \e[1;36m4 \e[1;32m]\e[1;37m.\e[1;36mManual (Font Default)\n";
		echo -en "$no[$cgreen 3$no-\e[1;32m4 $no] pilih > "; read input_menu_toilet;
		if [ "$input_menu_toilet" == "1" ]; then
			while $loopd_toilet; do
				clear; toilet $username_toilet;
		      	echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
		      	echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] apakah anda ingin menggantiNya? y/n : "; read replace_toilet;
		      	if [ "${replace_toilet,,}" == "y" ]; then
		      		main_toilet;
		      	elif [ "${replace_toilet,,}" == "n" ]; then
		      		clear; main_pwd; main_date;
					if [ -f ~/.bashrc ]; then
						find_bashrc_home;
						create_file_bashrc;
						echo "
clear; toilet $username_toilet
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
						failed_create_file;

					else
						create_file_bashrc;
						echo "
clear; toilet $username_toilet
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
						failed_create_file;
					fi;
		      	else
		      		echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
		      		loops_toilet=true;
	     	 	fi;
			done;

		elif [ "$input_menu_toilet" == "2" ]; then
			while $loops_toilet; do
		      	clear; toilet -f $file_font_f --gay $username_toilet;
				echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
		      	echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] apakah anda ingin menggantiNya? y/n : "; read replace_rainbow;
		      	if [ "${replace_rainbow,,}" == "y" ]; then
		      		main_toilet
		      	elif [ "${replace_rainbow,,}" == "n" ]; then
		      		clear; main_pwd; main_date;
					if [ -f ~/.bashrc ]; then
						find_bashrc_home;
						create_file_bashrc;
						echo "
clear; toilet -f $file_font_f --gay $username_toilet
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
						failed_create_file;

					else
						create_file_bashrc;
						echo "
clear; toilet -f $file_font_f --gay $username_toilet
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
						failed_create_file;
			      	fi;
				else
		      		echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
		      		loops_toilet=true;
				fi;
			done

			elif [ "$input_menu_toilet" == "3" ]; then
				while $loops_toilet; do
			      	clear; toilet -f $file_font_f --metal $username_toilet;
					echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
			      	echo -en "$no[$clgreen 4$no-\e[1;32m4 $no] apakah anda ingin menggantiNya? y/n : "; read replace_metal;
			      	if [ "${replace_metal,,}" == "y" ]; then
			      		main_toilet;
			      	elif [ "${replace_metal,,}" == "n" ]; then
			    	  		clear; main_pwd; main_date;
						if [ -f ~/.bashrc ]; then
							find_bashrc_home;
							create_file_bashrc;
							echo "
clear; toilet -f $file_font_f --metal $username_toilet
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
							failed_create_file;

						else
							create_file_bashrc;
							echo "
clear; toilet -f $file_font_f --metal $username_toilet
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
							failed_create_file;
			      		fi;
					else
						echo -e "\e[1;31m[X] oopss, tidak ada pilihan yang tepat!\e[0m"; sleep 1;
			      		loops_toilet=true;
					fi;
				done;

			elif [ "$input_menu_toilet" == "4" ]; then
				while $loops_toilet; do
				    	clear; run_color_figlet
				    	declare -A color_manual_array=(["1"]="\e[0m" ["2"]="\e[1;31m" ["3"]="\e[1;31m" ["4"]="\e[0;32m" ["5"]="\e[1;32m" ["6"]="\e[0;33m" ["7"]="\e[0;34m" ["8"]="\e[1;34m" ["9"]="\e[0;35m" ["10"]="\e[1;35m" ["11"]="\e[0;36m" ["12"]="\e[1;36m" ["13"]="\e[0;37m" ["14"]="\e[0;30m" ["15"]="\e[1;33m" ["16"]="\e[1;37m");
			   		echo -en "$no[$cgreen 4$no-\e[1;32m5 $no] color : " ; read input_color_manual;
					color_user_manual="${color_manual_array["${input_color_manual:-none}"]}";
					if [ "$input_color_manual" == "" ]; then
						echo -e "\e[1;31m[X] harus di isi\e[0m"; sleep 1;
						loops_toilet=true;
					elif [ -v color_manual_array["${input_color_manual:-none}"] ]; then
						clear; break;
					elif [ "$input_color_manual" == "17" ]; then
						main_manrainbow; break;
					else
						echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
						loops_toilet=true
					fi;
				done
				while $loops_toilet; do
			      	clear; echo -e "$color_user_manual$(toilet $username_toilet)\e[0m";
					echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
			      	echo -en "$no[$clgreen 5$no-\e[1;32m5 $no] apakah anda ingin menggantiNya? y/n : "; read replace_manual;
			      	if [ "${replace_manual,,}" == "y" ]; then
			      		main_toilet
			      	elif [ "${replace_manual,,}" == "n" ]; then
		    		  		clear; main_pwd; main_date;
						if [ -f ~/.bashrc ]; then
							find_bashrc_home;
							create_file_bashrc;
							echo "
echo -e '$color_user_manual'; clear; toilet $username_toilet; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
							failed_create_file;

						else
							create_file_bashrc;
							echo "
echo -e '$color_user_manual'; clear; toilet $username_toilet; echo -e '\e[0m'
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
							failed_create_file;
			      		fi;
			  		fi;
				done
			else
	      		echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
		      	loops_toilet2=true;
			fi;
	done;
}



function main_manrainbow () {

	lolcat_installer
	while true; do
		clear
		toilet $username_toilet | lolcat -a -d 1
		echo -e "\n\n\e[1;37mTampilan awal termux anda akan terlihat seperti di atas\e[0m";
		echo -en "[-] apakah anda ingin menggantiNya? y/n : "; read replace_manrainbow;
		if [ "${replace_manrainbow,,}" == "y" ]; then
			main_toilet;
		elif [ "${replace_manrainbow,,}" == "n" ]; then
	  		clear; main_pwd; main_date;
			if [ -f ~/.bashrc ]; then
				find_bashrc_home;
				create_file_bashrc;
				echo "
clear; toilet $username_toilet | lolcat -a -d 1
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
				failed_create_file; break;
			else
				create_file_bashrc
				echo "
clear; toilet $username_toilet | lolcat -a -d 1
$lct_pwd
$lct_direc
$uc_pwd
$u_pwd
$direc_ctn1
$direc_ctn2
$lct_date
$uc_date
$u_date" > /data/data/com.termux/files/home/.bashrc;
				failed_create_file; break;
			fi;
		fi;
	done;
}



function main_menu_replace_tamp () {

	loops_replace_1=true;
	while $loops_replace_1; do
		clear; logo_display_termux;
		echo -e "		\e[1;32m[ 0 ]\e[1;37m.\e[1;31mExit\e[0m\n";
		echo -e "	\e[1;32m[ \e[1;34m1 \e[1;32m]\e[1;37m.\e[1;36mFiglet\e[0m	\e[1;32m[ \e[1;34m2 \e[1;32m]\e[1;37m.\e[1;36mCowsay\e[0m";
		echo -e "	\e[1;32m[ \e[1;34m3 \e[1;32m]\e[1;37m.\e[1;36mNeofetch\e[0m	\e[1;32m[ \e[1;34m4 \e[1;32m]\e[1;37m.\e[1;36mToilet\e[0m";
		echo -e "	\e[1;32m[ \e[1;34m5 \e[1;32m]\e[1;37m.\e[1;36mTeks berbentuk logo\e[0m\n";
		echo -e "		\e[1;34m[ \e[1;36m6 \e[1;34m]\e[1;37m.\e[1;32mBANTUAN\e[0m\n"
		echo -en "\e[0mmasukan > "; read inpt_1;

		if [ "$inpt_1" == "0" ]; then
			exit 1;
		elif [ "$inpt_1" == "1" ]; then
			user_select_figlet; break;
		elif [ "$inpt_1" == "2" ]; then
			users_select_cowsay; break;
		elif [ "$inpt_1" == "3" ]; then
			main_neofetch; break;
		elif [ "$inpt_1" == "4" ]; then
			main_toilet; break;
		elif [ "$inpt_1" == "5" ]; then
			main_text_logo; break;
		elif [ "$inpt_1" == "6" ]; then
			clear; logo_help;
			echo -e "\e[1;36mExit	  \e[0;32mKeluar dari program ini.\n";
			echo -e "\e[1;36mFiglet	  \e[0;32mFont yang bergaya Figlet.\n	  jenis font: \e[1;34mdigital,shadow,slant,dsb.\n	  \e[1;33mColor: color code & rainbow (lolcat).\n";
			echo -e "\e[1;36mCowsay	  \e[0;32mMembentuk seperti gambar yang terbuat\n	  dari text.\n	  JenisNya: \e[1;34mdragon,eyes,skeleton,dsb.\n	  \e[1;33mColor: color code & rainbow (lolcat).\n";
			echo -e "\e[1;36mNeofetch  \e[0;32mMenampilkan informasi ponsel anda\n	  \e[1;34mSeperti: Memory,CPU,Kernel,OS,dsb.\n	  \e[1;33mColor: Default & Rainbow (lolcat).\n";
			echo -e "\e[1;36mToilet	  \e[0;32mFont yang bergaya seperti figlet.\n	  \e[1;34mJenis Font: Default & Font Figlet.\n	  \e[1;33mColor: color code,biru abu-abu,default\n	  rainbow (default & lolcat).\n";
			echo -e "\e[1;36mTeks berbentuk logo\n	  \e[0;32mHuruf yang membentuk sebuah logo.\n	  \e[1;34mJenisNya: Anonymous,Hacker Logo symbol\n	  topeng Anonymous,kepala tengkorak,dsb.\n	  \e[1;33mColor: color code & rainbow (lolcat).\e[0m\n"
			echo -e "\e[1;36mBANTUAN	  \e[0;32mMenampilkan ini.\n"
			echo -e "\n		  \e[1;36m[ \e[1;32mq \e[1;36m]\e[1;37m.\e[1;32mBACK\e[0m\e[25?l"
			user_input_q; main_menu_replace_tamp;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_replace_1=true;
		fi;
	done;
}















function main_help () {
	clear; logo_help_menu;
	echo -e "\e[1;32m+\e[1;34m==============================================\e[1;32m+";
	echo -e "\e[1;36m	    Install spesial Keyboard\e[0m\n  \e[1;34mMenambahkan \e[0m:\n  \e[1;32m[+] arrow button, /, HOME, END, PGUP, PGDN.\e[0m";
	echo -e "\e[1;32m+\e[1;34m==============================================\e[1;32m+";
	echo -e "\e[1;36m	    Ubah tampilan awal Termux\e[0m\n  \e[1;32mMengubah tampilan pada saat awal user login\n  termux atau membuka NEW SESSION.\e[0m";
	echo -e "\e[1;32m+\e[1;34m==============================================\e[1;32m+";
	echo -e "\e[1;36m	    Ubah style prompt Termux\e[0m\n  \e[1;32mMengubah gaya prompt atau symbol dolars\n  $ (default).\e[0m";
	echo -e "\e[1;32m+\e[1;34m==============================================\e[1;32m+";
	echo -e "\e[1;36m	    Ubah Warna Termux\e[0m\n  \e[1;32mMengubah Background, Foreground dan Cursor\n  termux anda.\e[0m";
	echo -e "\e[1;32m+\e[1;34m==============================================\e[1;32m+";
	echo -e "\e[1;36m	    BANTUAN\e[0m\n  \e[1;32mMenampilkan ini.\e[0m";
	echo -e "\e[1;32m+\e[1;34m==============================================\e[1;32m+";
	echo -e "\e[0m\n 		   \e[1;34m[\e[1;36mq\e[1;34m]\e[1;37m.\e[1;32mBACK\e[0m";
	echo -e "\e[25?l";
	user_input_q; main_menu;
}

function main_menu ()  {

	local loops_main_menu=true;

	while $loops_main_menu; do
		clear; logo_menu_xz;
		echo -e "	\e[1;32m[\e[1;36m0\e[1;32m]\e[1;37m.\e[1;34mEXIT\e[0m";
		echo -e "	\e[1;36m[\e[1;34m1\e[1;36m]\e[1;37m.\e[1;32mInstall spesial Keyboard\e[0m\n	\e[1;36m[\e[1;34m2\e[1;36m]\e[1;37m.\e[1;32mUbah style prompt Termux\e[0m";
		echo -e "	\e[1;36m[\e[1;34m3\e[1;36m]\e[1;37m.\e[1;32mUbah tampilan awal Termux\e[0m\n	\e[1;36m[\e[1;34m4\e[1;36m]\e[1;37m.\e[1;32mUbah warna termux\e[0m\n	\e[1;36m[\e[1;34m5\e[1;36m]\e[1;37m.\e[1;32mBANTUAN\e[0m\n";
		echo -en "Menu?> "; read var_menu;
		if [[ "$var_menu" == "0" ]]; then
			exit 1;
		elif [[ "$var_menu" == "1" ]]; then
			key_boardarrow;
		elif [[ "$var_menu" == "2" ]]; then
			main_prompt;
		elif [[ "$var_menu" == "3" ]]; then
			main_menu_replace_tamp
		elif [[ "$var_menu" == "4" ]]; then
			main_menu_color; exit 0
		elif [[ "$var_menu" == "5" ]]; then
			main_help;
		else
			echo -e "\e[1;31m[X] oopss, tidak ada menu!\e[0m"; sleep 1;
			loops_main_menu=true;
		fi;
	done;
}


#Start Program
main_menu;
