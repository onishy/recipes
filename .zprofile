export PATH=/Applications/octave-cli.app/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:/opt/local/lib/mysql56/bin
export PATH=$PATH:/opt/local/share/mysql56/support-files
export PATH=$PATH:/opt/local/libexec/qt5-mac/bin
export PATH=$PATH:/usr/local/gcc-arm-none-eabi-4_9-2015q2/bin

export LIBRARY_PATH=/opt/local/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/local/lib:$LD_LIBRARY_PATH
export CPATH=/opt/local/include:/opt/local/include/eigen3:$CPATH

export EIGEN3_INCLUDE_DIR=/opt/local/include/eigen3

if [ -z "$PS1" ]; then return ; fi
if [ -z $TMUX ] ; then
        if [ -z `tmux ls` ] ; then
                tmux
        else
                tmux attach
        fi
fi