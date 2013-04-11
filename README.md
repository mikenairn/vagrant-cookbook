vagrant Cookbook
================
Instll vagrant

Requirements
------------

Attributes
----------

Usage
-----
Just include `vagrant` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[vagrant]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github