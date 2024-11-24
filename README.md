# Modern Perl Project Template

[![Perl CI](https://github.com/pders01/perl-starter/actions/workflows/test.yml/badge.svg)](https://github.com/pders01/perl-starter/actions/workflows/test.yml)
![Perl Version](https://img.shields.io/badge/perl-5.36-blue.svg)
[![Perl Critic](https://img.shields.io/badge/critic-severity%201-brightgreen.svg)](https://metacpan.org/pod/Perl::Critic)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

<!-- DELETE FROM HERE -->

This is a modern Perl project template with best practices and tooling preconfigured:

- 🛠️ **Development Tools**
  - Carton for dependency management
  - Perltidy for code formatting
  - Perl::Critic (severity 1) for strict code quality
  - Perlimports for import management
  - Just command runner for common tasks

- 🧰 **VS Code Integration**
  - PerlNavigator configuration
  - Format on save (disabled by default)
  - Integrated linting and formatting

- 🚀 **CI/CD**
  - GitHub Actions for testing and releases
  - Automated testing on all commits
  - Automated releases on tags
  - Dependency caching for faster builds

To use this template:
1. Click "Use this template"
2. Replace pders01/perl-starter in badges
3. Delete this section
4. Start coding!

<!-- DELETE TO HERE -->

## Requirements

- Perl 5.36 or higher
- [Carton](https://metacpan.org/pod/Carton) for dependency management
- [Just](https://github.com/casey/just) command runner

## Installation

```bash
# Install dependencies
just install
```

## Development Commands

```bash
# Run tests
just test

# Format code
just fmt

# Lint code
just lint

# Run all checks
just check

# Watch for changes and run tests
just watch
```

## VS Code Setup

This project includes VS Code configuration for optimal Perl development:

1. Install recommended extensions when prompted
2. Perl tooling will be automatically configured
3. Use Command Palette → "Format Document" or enable format on save

## Release Process

```bash
# Create a new version
git tag v1.0.0
git push origin v1.0.0
```

This will:
1. Run all tests
2. Create a GitHub release
3. Generate release notes

## License

MIT - See [LICENSE](LICENSE) for details

---
Created by [pders01](https://github.com/pders01) with ❤️  
Special thanks to [bscan](https://github.com/bscan) for Perl::Critic configuration inspiration and [Cascade (Codeium AI)](https://codeium.com) for assistance.
