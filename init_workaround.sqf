
	sleep 2;

	newobject = {
		_instance = (missionNamespace getVariable ["oo_instance", 0]) + 1;
		missionNamespace setVariable["oo_instance", _instance];
		
		_code = compile format ['
			private _data = missionNamespace getVariable ["oo_data_%1", []];

			_set_prenom = {
				_data set [0,_this];
				missionNamespace setVariable ["oo_data_%1", _data];
			};

			_set_nom = {
				_data set [1,_this];
				missionNamespace setVariable ["oo_data_%1", _data];
			};

			_get_prenom = {
					_data select 0;
					(missionNamespace getVariable ["oo_data_%1", []]) select 0;
			};

			_get_nom = {
					_data select 1;
			};

			(_this select 1) call (call compile (_this select 0));
		', _instance];
		_code;
	};

	_object = call newobject;
	["_set_prenom", "billy"] call _object;
	["_set_prenom", "tom"] call _object;
	_result = ["_get_prenom", ""] call _object;
	hint format ["%1", _result];