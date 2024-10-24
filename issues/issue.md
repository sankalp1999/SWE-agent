# Flask Application Initialization and SQLAlchemy Table Definition Issues

## Issue Description
Multiple test failures in the Restaurant Management System Flask application related to application initialization and database table definitions.

### Primary Error
Missing Flask application instance and SQLAlchemy table definition conflicts.

### Location
- Primary failure in `app/__init__.py`
- Secondary failure in `app/models.py` and related files

### Stack Trace
```python
AssertionError: Flask application instance not found
sqlalchemy.exc.InvalidRequestError: Table 'menu_items' is already defined for this MetaData instance.
```

### Root Cause
1. The Flask application instance `app` is not properly defined in `__init__.py`
2. The `MenuItem` model is being defined multiple times, causing SQLAlchemy metadata conflicts

## Impact
- Application initialization fails
- Database models cannot be properly loaded
- Route testing cannot proceed due to upstream failures

## Proposed Solutions

1. For `__init__.py`:
```python
from flask import Flask
app = Flask(__name__)
# Add other necessary configurations
```

2. For SQLAlchemy table definition issue:
- Add `extend_existing=True` to the model definition
- Ensure the model is only imported once
- Review circular imports in the application structure

## Additional Notes
- The warning about duplicate class definitions suggests possible circular imports
- Consider restructuring the application to avoid multiple model imports
- Review the application factory pattern implementation if being used

## Related Files
- `app/__init__.py`
- `app/models.py`
- `app/routes.py`
- `tests/test_routes.py`