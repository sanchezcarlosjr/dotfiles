#!/usr/bin/zsh

# Zimfw restart script
# Uninstalls and reinstalls zimfw modules


echo "🔄 Restarting Zimfw..."

chdir $DOTFILES_PATH

echo "📦 Uninstalling current modules..."
zimfw uninstall

echo "🧹 Cleaning cache directories..."
rm -rf ~/.config/zim/modules
rm -rf ~/.local/share/zim/modules
rm -rf ~/.dotfiles/shell/zsh/.zim/modules

echo "📥 Installing modules..."
zimfw install

echo "✅ Zimfw restart complete!"
echo "💡 Restart your terminal for changes to take effect."
