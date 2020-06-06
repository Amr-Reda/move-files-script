param ($l, $e, $x, $d)

write-host "*- location: $l";
write-host "*- extensions: $e";
write-host "*- exclude: $x";
write-host "*- destination: $d";
# .\script.ps1 -l 'C:\Users\Amr\Downloads\shell-test' -e 'js ts' -x 'C:\Users\Amr\Downloads\shell-test\target\tmp /rrrrr' -d 'C:\Users\Amr\Downloads\shell-test\store'

$arr_excludes = $x.split(" ")
$arr_extensions = $e.split(" ")

$sub_dirs =$( Get-ChildItem -Path $l -Recurse -Directory -Force -ErrorAction SilentlyContinue).Fullname

foreach ($sub_dir in $sub_dirs) { 
    $should_ignored = $arr_excludes.Contains($sub_dir)
    if(!$should_ignored) {
        foreach ($ext in $arr_extensions) { 
            Move-Item $sub_dir\*.$ext $d
        }
    }
}