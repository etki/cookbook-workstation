# workstation Cookbook

This is a personal cookbook for recreating my workstation from scratch.
Probably you will never need it.

## Requirements

### Platforms

- Ubuntu

### Chef

- Chef 12.0+

### Cookbooks

- `git`
- `php`
- `nvm`
- `rvm`
- `docker`
- `chrome`
- `chromedriver`
- `phantom`

## Attributes


### workstation::default

TBD

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['workstation']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### workstation::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `workstation` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[workstation]"
  ]
}
```

## Contributing

TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

MIT License // Etki
