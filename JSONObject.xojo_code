#tag Class
Protected Class JSONObject
Inherits JSONItem
	#tag Method, Flags = &h21
		Private Sub Append(Value as Variant)
		  
		  // this is private, and gets never called
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Boolean)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Currency)
		  
		  // convert a Currency to Double or JSONItem will ignore it
		  super.Append(CType(Value, Double))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Double)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Int16)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Int32)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Int64)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Int8)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Object)
		  
		  #pragma breakOnExceptions false
		  
		  // accept a JSONItem (including JSONObject, which IS a JSONItem)
		  if value isA JSONItem then
		    if value is self then
		      
		      // raise an exception on circular references
		      dim exc as new JSONException("The appended value is a circular reference to self", JSONException.IllegalValue, "not allowed")
		      raise exc
		      
		    else
		      
		      super.Append(value)
		      
		    end if
		    
		  elseif value is nil then
		    
		    super.Append(nil)
		    
		  else
		    
		    // for anything else than NIL or JSONItem
		    // try to implicitly convert it to a string
		    // if it's not possible, add it as NIL
		    try
		      dim v as variant = Value
		      dim s as string = v.stringValue
		      super.Append(s)
		    catch
		      super.Append(nil)
		    end try
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as Single)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as String)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as UInt16)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as UInt32)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as UInt64)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendValue(Value as UInt8)
		  
		  super.Append(Value)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Boolean)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Currency)
		  
		  super.Value(Index) = CType(Value, Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Double)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Int16)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Int32)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Int64)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Int8)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Object)
		  
		  #pragma breakOnExceptions false
		  
		  if value isA JSONItem then
		    if value is self then
		      
		      dim exc as new JSONException("The value is a circular reference to self", JSONException.IllegalValue, "not allowed")
		      raise exc
		      
		    else
		      
		      super.Value(Index) = Value
		      
		    end if
		    
		  elseif value is nil then
		    
		    super.Value(Index) = nil
		    
		  else
		    
		    try
		      dim v as variant = Value
		      dim s as string = v.stringValue
		      super.Value(Index) = s
		    catch
		      super.Value(Index) = nil
		    end try
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as Single)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as String)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as UInt16)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as UInt32)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as UInt64)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Index as Integer, assigns Value as UInt8)
		  
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Boolean)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Currency)
		  
		  super.Value(Name) = CType(Value, Double)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Double)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Int16)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Int32)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Int64)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Int8)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Object)
		  
		  #pragma breakOnExceptions false
		  
		  if value isA JSONItem then
		    if value is self then
		      
		      dim exc as new JSONException("The value is a circular reference to self", JSONException.IllegalValue, "not allowed")
		      raise exc
		      
		    else
		      
		      super.Value(Name) = Value
		      
		    end if
		    
		  elseif value is nil then
		    
		    super.Value(Name) = nil
		    
		  else
		    
		    try
		      dim v as variant = Value
		      dim s as string = v.stringValue
		      super.Value(Name) = s
		    catch
		      super.Value(Name) = nil
		    end try
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as Single)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as String)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as UInt16)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as UInt32)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as UInt64)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Name as String, assigns Value as UInt8)
		  
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Value(Index as Integer, assigns Value as Variant)
		  
		  // this is private, and gets never called
		  super.Value(Index) = Value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Value(Name as String, assigns Value as Variant)
		  
		  // this is private, and gets never called
		  super.Value(Name) = Value
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = About
		JSONObject
		©2016 by Massimo Valle
		Provided with MIT license. See the enclosed LICENSE file.
		
		This class is a subclass of the original JSONItem class built-in in Xojo and it's meant to fix
		some problems/bugs reported below:
		
		- The JSONItem class accept values and array elements as Variant.
		<feedback://showreport?report_id=42959>
		This mean it's possible to assign to JSONItem ANY kind of object and thus creating invalid JSON objects
		which doesn't render/serialize. A such problem is only detected when rendering the object to obtain
		a JSON string (Exception).
		
		- The JSONItem doesn't render added objects which implicitly convert to string or JSONItem
		<feedback://showreport?report_id=42959>
		Despite the use of Variant any object that can be implicitly converted to a string or JSONItem is added
		as the original object, producing again invalid JSON.
		Additionally, when a such invalid object is rendered, the JSONException is misleading: it reports
		the object is not valid but shows the string resulting from conversion. Like to say a string is invalid.
		
		- The JSONItem permit to create circular references
		<feedback://showreport?report_id=42969>
		It's possible to add a JSONItem to itself.
		This crash completely the Xojo IDE or the application when the JSONItem is rendered with JSONItem.toString().
		
		Implementation
		--------------
		To solve the above problems  it's not possible to keep the current methods Append() and Value() due to a Xojo bug
		related to wrong overloaded methods resolution.
		<feedback://showreport?report_id=42971>
		There are then new methods to add values and append items to an array object.
		
		Usage
		-----
		To set a value use the SetValue() methods existing in two sorts (by name or by index)
		The syntax is the same of the JSONItem.Value() methods
		
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
		Add every numeric value allowed in Xojo, either by name or by index.
		The Currency version permits to add Currency value, however due the JSONItem superclass won't consider
		Currency values, it's first converted to a Double. Warning: rounding errors can happen.
		
		SetValue(Index as Integer, assigns Value as String)
		SetValue(Name as String, assigns Value as String)
		Add a string value.
		
		SetValue(Index as Integer, assigns Value as Boolean)
		SetValue(Name as String, assigns Value as Boolean)
		Add a boolean value.
		
		SetValue(Index as Integer, assigns Value as Object)
		SetValue(Name as String, assigns Value as Object)
		Add NIL, JSONItem, JSONObject or any other object can be implicitly converted to a string.
		With this method you can also add a Date object and get the string representation in JSON.
		
		----------------------------------------------------------------------------------------------------------
		
		To append a value to an array use the AppendValue() methods.
		The syntax is the same of the JSONItem.Append() method
		
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
		Append every numeric value allowed in Xojo.
		
		AppendValue(Value as Currency)
		This method was added to permit appending Currency values. However due the JSONItem superclass won't consider
		Currency values, it's first converted to a Double. Warning: rounding errors can happen.
		
		AppendValue(Value as String)
		Append a string
		
		AppendValue(Value as Boolean)
		Append a boolean
		
		AppendValue(Value as Object)
		Append NIL, JSONItem or any other object can be implicitly converted to a string
		
		----------------------------------------------------------------------------------------------------------
	#tag EndNote


	#tag ViewBehavior
		#tag ViewProperty
			Name="Compact"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DecimalFormat"
			Group="Behavior"
			InitialValue="-0.0##############"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EscapeSlashes"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IndentSpacing"
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ToString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_RenderAsJavascript"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
