# JSONObject
A Xojo JSONItem enhancement

This class is a subclass of the original JSONItem class built-in in Xojo and it's meant to fix some problems/bugs reported below:

- The JSONItem class accept values and array elements as Variant.  
<feedback://showreport?report_id=42959>  
This mean it's possible to assign to JSONItem ANY kind of object and thus creating invalid JSON objects which doesn't render/serialize. A such problem is only detected when rendering the object to obtain a JSON string (Exception).

- The JSONItem doesn't render added objects which implicitly convert to string or JSONItem  
<feedback://showreport?report_id=42959>  
Despite the use of Variant any object that can be implicitly converted to a string or JSONItem is added as the original object, producing again invalid JSON.
Additionally, when a such invalid object is rendered, the JSONException is misleading: it reports the object is not valid but shows the string resulting from conversion. Like to say a string is invalid.

- The JSONItem permit to create circular references  
<feedback://showreport?report_id=42969>  
It's possible to add a JSONItem to itself.
This crash completely the Xojo IDE or the application when the JSONItem is rendered with JSONItem.toString().

Implementation
--------------
To solve the above problems  it's not possible to keep the current methods Append() and Value() due to a Xojo bug related to wrong overloaded methods resolution.  
<feedback://showreport?report_id=42971>  
There are then new methods to add values and append items to an array object.

Quick Reference
---------------
To set a value use the `SetValue()` methods existing in two sorts (by name or by index).  
The syntax is the same of the `JSONItem.Value()` methods

```
SetValue(Index as Integer, assigns Value as Int8)
SetValue(Index as Integer, assigns Value as Int16)
SetValue(Index as Integer, assigns Value as Int32)
SetValue(Index as Integer, assigns Value as Int64)
SetValue(Index as Integer, assigns Value as UInt8)
SetValue(Index as Integer, assigns Value as UInt16)
SetValue(Index as Integer, assigns Value as UInt32)
SetValue(Index as Integer, assigns Value as UInt64)
SetValue(Index as Integer, assigns Value as Single)
SetValue(Index as Integer, assigns Value as Double)
SetValue(Index as Integer, assigns Value as Currency)
SetValue(Name as String, assigns Value as Int8)
SetValue(Name as String, assigns Value as Int16)
SetValue(Name as String, assigns Value as Int32)
SetValue(Name as String, assigns Value as Int64)
SetValue(Name as String, assigns Value as UInt8)
SetValue(Name as String, assigns Value as UInt16)
SetValue(Name as String, assigns Value as UInt32)
SetValue(Name as String, assigns Value as UInt64)
SetValue(Name as String, assigns Value as Single)
SetValue(Name as String, assigns Value as Double)
SetValue(Name as String, assigns Value as Currency)
```
Add every numeric value allowed in Xojo, either by name or by index.  
The Currency version permits to add Currency value, however due the JSONItem superclass won't consider Currency values, it's first converted to a Double.
**Warning:** rounding errors can happen.


```
SetValue(Index as Integer, assigns Value as String)
SetValue(Name as String, assigns Value as String)
```
Add a string value.

```
SetValue(Index as Integer, assigns Value as Boolean)
SetValue(Name as String, assigns Value as Boolean)
```
Add a boolean value.

```
SetValue(Index as Integer, assigns Value as Object)
SetValue(Name as String, assigns Value as Object)
```
Add NIL, JSONItem, JSONObject or any other object can be implicitly converted to a string. With this method you can also add a Date object and get the string representation in JSON.

--

To append a value to an array use the `AppendValue()` methods.
The syntax is the same of the `JSONItem.Append()` method

```
AppendValue(Value as Int8)
AppendValue(Value as Int16)
AppendValue(Value as Int32)
AppendValue(Value as Int64)
AppendValue(Value as UInt8)
AppendValue(Value as UInt16)
AppendValue(Value as UInt32)
AppendValue(Value as UInt64)
AppendValue(Value as Single)
AppendValue(Value as Double)
```
Append every numeric value allowed in Xojo.

```
AppendValue(Value as Currency)
```
This method was added to permit appending Currency values. However due the JSONItem superclass won't consider Currency values, it's first converted to a Double.  
**Warning:** rounding errors can happen.

```
AppendValue(Value as String)
```
Append a string

```
AppendValue(Value as Boolean)
```
Append a boolean

```
AppendValue(Value as Object)
```
Append NIL, JSONItem, JSONObject or any other object can be implicitly converted to a string. With this method you can also add a Date object and get the string representation in JSON.

Example Output
--------------
```js
{
    "aBoolean":true,
    "aInteger":-12345,
    "aInt8":-123,
    "aInt16":-1234,
    "aInt32":-12345,
    "aInt64":-123456,
    "aUInt8":123,
    "aUInt16":1234,
    "aUInt32":12345,
    "aUInt64":123456,
    "aDouble":1.2345,
    "aSingle":1.233999967575073,
    "aCurrency":1234.123399999999947,
    "aString":"A string",
    "aNil":null,
    "aDate":"2016-03-15 21:46:57",
    "aClassNotConvertingToString":null,
    "aJSONItem":{
        "JSONItemValue":"This is from a JSONItem"
    },
    "aJSONObject":{
        "JSONObjectValue":"This is from a JSONObject"
    },
    "anArray":[
        true,
        -12345,
        -123,
        -1234,
        -12345,
        -123456,
        123,
        1234,
        12345,
        123456,
        1.2345,
        1.233999967575073,
        1234.123399999999947,
        "A string",
        null,
        "2016-03-15 21:46:57",
        null,
        {
            "JSONItemValue":"This is from a JSONItem"
        },
        {
            "JSONObjectValue":"This is from a JSONObject"
        }
    ]
}
```