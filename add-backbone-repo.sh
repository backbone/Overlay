echo "requires app-eselect/eselect-repository" 

eselect repository add backbone git https://github.com/backbone/Overlay.git
emaint sync -r backbone 
