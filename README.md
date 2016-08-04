# lincall

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Usage](#usage)
4. [Contributing](#contributing)

## Overview

A puppet module to enable click-to-call on the desktop with linphone.

## Module Description

This module registers the `tel:` protocol with a [Desktop Entry
Specification](http://standards.freedesktop.org/desktop-entry-spec/latest/),
allowing the user to click on a link in his web browser to call a number.

## Usage

This module is dead simple!  Just include it at some point in your manifest:

~~~puppet
include ::lincall
~~~

## Contributing

1. Fork it ( https://github.com/opus-codium/lincall/fork );
2. Create your feature branch (`git checkout -b my-new-feature`);
3. Commit your changes (`git commit -am 'Add some feature'`);
4. Push to the branch (`git push origin my-new-feature`);
5. Create a new Pull Request.
