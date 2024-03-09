# Type Shared Prefs

This package extends the base package with a simplified API on the KeyValueStore object to make it easier to write values to the shared prefs and to read.

usage is as simple as that
```dart
    /// initialize a store 
    var store = KeyValueStore();
    /// simple write
    store.write("testKey", 42);
    int? storedValue = store.getValue("testKey"); /// the type is inferred 
    store.delete("testKey");
```