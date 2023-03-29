class Recipe{
 String _name;
 String _bywho;
 List<String> _ingredients;
 List<String> _steps;

 Recipe(this._name, this._bywho, this._ingredients, this._steps);

 String get name => _name;

  set name(String value) {
    _name = value;
  }

 List<String> get ingredients => _ingredients;

 List<String> get steps => _steps;

  set steps(List<String> value) {
    _steps = value;
  }

  set ingredients(List<String> value) {
    _ingredients = value;
  }

 String get bywho => _bywho;

  set bywho(String value) {
    _bywho = value;
  }
}