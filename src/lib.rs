use zed_extension_api as zed;

struct FortranExtension;

impl zed::Extension for FortranExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &zed::LanguageServerId,
        worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let command = worktree
            .which("fortls")
            .ok_or_else(|| "fortls is not installed or is not on PATH.".to_string())?;

        Ok(zed::Command {
            command,
            args: vec![
                "--lowercase_intrinsics".to_string(),
                "--notify_init".to_string(),
                "--disable_diagnostics".to_string(),
            ],
            env: Default::default(),
        })
    }
}

zed::register_extension!(FortranExtension);
