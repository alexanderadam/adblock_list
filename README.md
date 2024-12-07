# Alex's list to remove clutter from websites

This repository hosts [a curated list of uBlock Origin rules](alexanderadam.txt) designed to enhance your browsing experience by blocking ads, trackers, and other unwanted web content.
While it should be compatible to [uBlock Origin](https://ublockorigin.com/) it probably works with other AdBlockers, too.

Have a look at the [installation instructions](https://alexanderadam.github.io/adblock_list/#installation) to get started!

## Disclaimer

The rules might change the display of websites significantly.
Things might not work as expected, and some websites might not work at all.
If you encounter any issues, please [open an issue](https://github.com/alexanderadam/adblock_list/issues/new) with a detailed description of the problem, including the URL of the website and screenshots if possible.
You will find the affected hosts [here](hosts.md).

## Contributing

Contributions to improve the adblock list are welcome! If you have suggestions or want to add new rules, please follow these steps:

1. [Fork the repository](https://github.com/alexanderadam/adblock_list/fork).
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -am 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a new Pull Request.

To set up the pre-commit hook, run the following commands:

```sh
cp scripts/pre-commit.sh .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

## Acknowledgments

- Thanks to everyone who has contributed to this project!
- Special thanks to [the uBlock Origin team](https://github.com/gorhill/uBlock?tab=readme-ov-file#ublock-origin-ubo) for their fantastic ad-blocking tool.

Enjoy a cleaner and faster web browsing experience with this curated list!
