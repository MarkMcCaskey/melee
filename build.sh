HERE=$(dirname "$(readlink -f $0)")
clean=false
rebuild_pattern=
expected=false
generate_map=0
non_matching=0
frank=0
clear=false

usage="$(basename "$0") [-cemnfxh] [-r pattern]

where
    -h  help: show this message
    -c  clean: ""make clean"" before running make
    -r  rebuild: delete *.o files matching the given pattern; -c takes priority
    -e  expected: after a successful make run, sync ./build to ./expected/build
                  (requires ""pacman -S rsync"")
    -f  frank: pass EPILOGUE_PROCESS=1 to make
    -m  map: pass GENERATE_MAP=1 to make
    -n  non-matching: pass NON_MATCHING=1 to make
    -x  clear: clear the console before executing this script"

while getopts ":cr:emnfxh" arg; do
    case $arg in
    h) echo "$usage"
       exit
       ;;
    c) clean=true ;;
    r) rebuild_pattern=$OPTARG ;;
    e) expected=true ;;
    m) generate_map=1 ;;
    n) non_matching=1 ;;
    f) frank=1 ;;
    x) clear=true ;;
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
    \?) printf "illegal option: -%s\n" "$OPTARG" >&2
        echo "$usage" >&2
        exit 1
        ;;
    esac
done

if [ $clear = true ]; then
    clear
fi

pushd $HERE
if [ "$clean" = true ]; then
    echo "Cleaning."
    make clean
elif [ "$rebuild_pattern" ]; then
    rebuild_pattern="*/${rebuild_pattern}*.o"
    echo "Deleting files matching pattern $rebuild_pattern"
    find ./build -iwholename $rebuild_pattern -delete
fi

echo "Running make with NON_MATCHING=$non_matching GENERATE_MAP=$generate_map EPILOGUE_PROCESS=$frank"
make NON_MATCHING=$non_matching GENERATE_MAP=$generate_map EPILOGUE_PROCESS=$frank
result=$?

if [ "$expected" = true ]; then
    if [ "$result" != 0 ]; then
        echo >&2 "Make failed. Not syncing to expected."
    else
        echo "Syncing build to expected."
        rsync -a --delete build/ expected/build/
    fi
fi
popd
