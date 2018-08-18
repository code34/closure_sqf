	newobject = {
		private _nom  = "bob";
		private _prenom = "charly";

		{
			_set_prenom = {
				_prenom = _this;
			};

			_set_nom = {
				_nom = _this;
			};

			_get_prenom = {
					_prenom;
			};
			(_this select 1) call (call compile (_this select 0));
		};
	};

	sleep 2;
	
	_object = call newobject;
	["_set_prenom", "billy"] call _object;
	_result = ["_get_prenom", ""] call _object;
	hint format ["result: %1", _result];

