## Changelog

### 0.7.2
- Minor cleanup in README files, and RELEASE.md renamed to
  CHANGELOG.md.

### 0.7.1
- Delete `dev/` directory from the `main` branch. It is now available
  in the `dev` branch.

### 0.7.0
- `main` branch is the default branch now.
- Added `xlm` and `clean` Makefile targets.
- Consolidated `run/` and `test/` content into the `test/` directory.
- `api/` content is moved to `docs/` directory in `docs` branch. Docs
  hosted at https://kaushalmodi.github.io/cluelib/ .
- Add the Cluelib test from edaplayground to the repo.

### v0.6.1
- Added `route_node::id` property.

### v0.6.0
- Added `route`, `route_node`, and `route_breadth_first_iterator` classes.
- Added `tree::has_child` function.

### v0.5.3
- Updated the API document.

### v0.5.2
- Added `tree_node::relatives` property.

### v0.5.1
- Updated the Overview.

### v0.5.0
- Renamed `tree::add_node` funtion to `tree::add_to_node`.
- Renamed `tree::rebase` function to `tree::update_locations`.
- Added `tree::graft` function.

### v0.4.0
- Added `tree`, `tree_node`, `tree_breadth_first_iterator`, `decimal_min_formatter`, and `hex_min_formatter` classes.
- Fixed a bug in `collection::contains`.
- Changed `collection::size` from `pure virtual` to `virtual` and added default implementation using an iterator.

### v0.3.0
- Added `network` class.
- The `journal` class no longer opens the log files (`journal.log` and
  `journal.csv`) by default. It is now user's responsibility to open the
  files. As a consequence, the macros (`CL_NAME_OF_LOG` and `CL_NAME_OF_CSV`)
  are obsolete.
- DPI-C is disabled by default (`cl_define.svh`).
- Fixed a bug in `crc::crc`.
- Fixed a bug in `data_stream::separated`.

### v0.2.0
- Added `journal::csv` function to store a transaction in the CSV (comma
  separated value) format.
- Added `CL_NAME_OF_CSV` macro to define the name of a CSV file used by the
  *journal* class.
- Renamed `CL_NAME_OF_JOURNAL` macro to `CL_NAME_OF_LOG`.

### v0.1.0
- Initial public release
