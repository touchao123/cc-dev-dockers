
[login]
``` ssh jlr@16.tcp.cpolar.top -p 13330 ```

user/passwd jlr:jlr

[Introduction]
==The 'v2x' folder is a persist folder mapping from host, for the purpose of storing source.
==The '.conna' is cache folder also mapping from host, since there are storing many of dependency binarary. 

[Working Folder]
``` cd  /home/jlr/v2x/ ```
`` git clone url_repo your_working_folder ``

[Building]
``` cp ~/env/build-x86-script.sh your_build ``

[Demo]
[jlr@jlr-s1 ~/v2x/v2x_usecases/conan-build]$ ./build-x86-script.sh
1:clang-tidy
2:clang-format&newline
3:build
4:test:unit
5:test:functional
6:test:coverage
7:all steps
Enter your choice:


[Toolsets]
1> clang
2> clang-format
3> conan version 1.59
4> lazygit
5> cpolar 


[INFO]
Here is container run parameters

docker run -d \
--hostname=jlr-s1 \
--name=tw_jlr_cc  \
-p 2022:22  \
-v ~/Documents/V2X/v2x_infra/Users/tw/env:/home/jlr/env \
-v ~/Documents/V2X/v2x_infra/Users/tw/.conan:/home/jlr/.conan \
-v ~/Documents/V2X/v2x_infra/Users/tw/v2x:/home/jlr/v2x \
chao123/jlr_v2x_cc
