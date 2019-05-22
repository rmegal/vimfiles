$baseDir = join-path $env:userprofile "vimfiles"
$pluginDir = "bundle"
$autoloadDir = "autoload"

Set-LocationEx $baseDir

$plugins = @(
  "PProvost/vim-ps1",
  "airblade/vim-gitgutter",
  "drewtempelmeyer/palenight.vim",
  "kien/ctrlp.vim",
  "leafgarland/typescript-vim",
  "neoclide/vim-jsx-improve",
  "posva/vim-vue",
  "scrooloose/nerdtree",
  "terryma/vim-multiple-cursors",
  "tpope/vim-abolish",
  "tpope/vim-dispatch",
  "tpope/vim-pathogen",
  "vim-airline/vim-airline",
  "vim-airline/vim-airline-themes",
  "vim-syntastic/syntastic"
)

foreach ($plugin in $plugins)
{
    $dirname = (basename $plugin)
    $command = ("git submodule add -b master https://github.com/{0}.git {1}/{2}" -f $plugin, $pluginDir, $dirname)
    write-output $command
    Invoke-Expression $command
}

$sourceFile = join-path $plugindir "vim-pathogen\autoload\pathogen.vim"
$targetFile = join-path $autoloadDir "pathogen.vim"
copy-item $sourceFile $targetFile # -whatif

<#
 # Placing the dracula theme in the correct location for pathogen
 #>
git submodule add -b master https://github.com/dracula/vim.git bundle/dracula-theme

&git submodule update --recursive --remote

<#
 # Attach HEAD and pickup latest commits
 #>
Get-ChildItem $pluginDir -Directory | % { Set-LocationEx $_.FullName; git pull origin master; git checkout master; git pull }
Set-LocationEx $baseDir

