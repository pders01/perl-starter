# Justfile for Perl development workflow
# Created by Cascade (Codeium AI) - https://codeium.com
# Provides standardized commands for testing, linting, and development

# Set to 'system' to use system perl, defaults to carton
perl_env := env_var_or_default("PERL_ENV", "carton")

# Perl executor setup
_carton := if perl_env == "system" { "" } else { "carton exec --" }

# List available recipes
default:
    @just --list

# Install dependencies (carton by default, or cpanm if PERL_ENV=system)
install:
    #!/usr/bin/env bash
    if [ "{{perl_env}}" = "system" ]; then
        echo "Installing with cpanm..."
        cpanm --installdeps .
    else
        echo "Installing with carton..."
        carton install
    fi

# Format all Perl files
fmt:
    find . -type f \( -name "*.p[lm]" -o -name "*.t" \) -not -path "./local/*" | xargs -n1 perltidy -b -bext="/"

# Run Perl::Critic on all Perl files
lint:
    find . -type f \( -name "*.p[lm]" -o -name "*.t" \) -not -path "./local/*" | xargs -n1 {{_carton}} perlcritic

# Run tests with prove
test:
    {{_carton}} prove -l t

# Run tests with coverage
test-coverage:
    #!/usr/bin/env bash
    {{_carton}} sh -c "PERL5OPT=-MDevel::Cover prove -l t && cover"

# Clean up backup and temporary files
clean:
    find . -type f -name "*.bak" -o -name "*.old" -o -name "*.swp" -delete
    rm -rf cover_db local .carton

# Run all checks (format, lint, test)
check: fmt lint test

# Watch for changes and run tests
watch:
    find . -name "*.p[lm]" -o -name "*.t" | entr -c just test

# Show current Perl environment
env:
    @echo "Using {{perl_env}} Perl environment"
