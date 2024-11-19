# [tyrion/mr-template][]

p4p4j0hn's dotfiles using [myrepos][] and [vcsh][].

For a detailed explanation see:
[_Conquer your dotfiles with VCSH and MR_][blog-post].

[tyrion/mr-template]: https://github.com/tyrion/mr-template/
[myrepos]: https://myrepos.branchable.com/
[vcsh]: https://github.com/RichiH/vcsh
[blog-post]: https://germano.dev/dotfiles/

## Structure of the repository

- `main` branch for README and stuff that won't end up in your `$HOME`.
- `mr` branch for the configuration of myrepos.
- all other branches for your applications and their dotfiles.

## Structure of the `mr` branch

```plain
.
├── .config
│   └── mr
│       ├── available.d
│       │   └── mr.vcsh
│       └── config.d
│           └── mr.vcsh -> ../available.d/mr.vcsh
└── .mrconfig
```

The contents of this branch can be summarized as follows:

- `.mrconfig`: the entrypoint configuration file for mr,
- `.config/mr/available.d/`: repository definitions for your applications,
- `.config/mr/config.d/`: repository definitions active in the current system.
  Contains symlinks to `available.d/`.

## How to add a new application

1. Fork this repo
2. Add a repository definition to `./config/mr/available.d/` in the `mr` branch.
3. Symlink it to `config.d` if you want it to be activated by default.
4. Create a new branch with `git checkout -b your_app init`.
5. Add your dotfiles
6. Push

## How to use on a new system

Clone the mr branch with vcsh:

```bash
vcsh clone -b mr https://example.com/your-fork mr
```

Enable/disable the repository definitions that you want on the system:

```bash
cd .config/mr
ln -s ../available.d/i3.vcsh config.d/
```

Checkout everything with mr:

```bash
mr checkout
```
