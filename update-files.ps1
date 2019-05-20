$baseDir = join-path $env:userprofile "vimfiles"
$pluginDir = "bundle"
$colorsDir = "colors"
$autoloadDir = "autoload"

Set-LocationEx $baseDir

$plugins = @(
  "kien/ctrlp.vim",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "scrooloose/nerdtree",
  "tpope/vim-pathogen",
  "terryma/vim-multiple-cursors",
  "airblade/vim-gitgutter",
  "leafgarland/typescript-vim",
  "neoclide/vim-jsx-improve",
  "posva/vim-vue",
  "drewtempelmeyer/palenight.vim",
  "tpope/vim-abolish"
)

foreach ($plugin in $plugins)
{
    $dirname = (basename $plugin)
    $command = ("git submodule add -b master https://github.com/{0}.git {1}/{2}" -f $plugin, $pluginDir, $dirname)
    write-output $command
    Invoke-Expression $command
}

<#
 # Attach HEAD and pickup latest commits
 #>
Get-ChildItem $pluginDir -Directory | % { Set-LocationEx $_.FullName; git pull origin master; git checkout master; git pull }
Set-LocationEx $baseDir

$sourceFile = join-path $plugindir "vim-pathogen\autoload\pathogen.vim"
$targetFile = join-path $autoloadDir "pathogen.vim"
copy-item $sourceFile $targetFile # -whatif

git submodule add -b master https://github.com/dracula/vim.git bundle/dracula-theme

$sourceFile = join-path $plugindir "dracula-theme\colors\dracula.vim"
$targetFile = join-path $colorsDir "dracula.vim"
copy-item $sourceFile $targetFile # -whatif

$sourceFile = join-path $plugindir "palenight.vim\colors\palenight.vim"
$targetFile = join-path $colorsDir "palenight.vim"
copy-item $sourceFile $targetFile # -whatif

&git submodule update --recursive --remote

