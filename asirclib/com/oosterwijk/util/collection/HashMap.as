/*
 Copyright (c) 2006 Eric J. Feminella  <eric@ericfeminella.com>
 All rights reserved.
  
 Permission is hereby granted, free of charge, to any person obtaining a copy 
 of this software and associated documentation files (the "Software"), to deal 
 in the Software without restriction, including without limitation the rights 
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is furnished 
 to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all 
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
 INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
 PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
 OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

 @ignore
 */
package com.oosterwijk.util.collection
{
    import flash.utils.Dictionary;

    /**
     * IMap implementation which dynamically creates a HashMap of 
     * key and value pairs as well as provides a atandard API for
     * working with the HashMap
     * 
     * Note: This file was taken from Eric J. Feminella and modified 
     * to add some extra features. 
     * 
     */
    dynamic public class HashMap extends Dictionary implements IMap
    {
        /**
         * By default, weak key references are used in order to ensure
         * that objects are eligible for Garbage Collection
         * 
         * @param  specifies if weak key references should be used
         */        
        public function HashMap(useWeakReferences:Boolean = true)
        {
            super(useWeakReferences);
        }
        
        /**
         * Adds a key / value to the current Map
         * 
         * @param the key to add to the map
         * @param the value of the specified key
         */
        public function put(key:String, value:*):void
        {
            this[key] = value;    
        }

        /**
         * Removes a key / value from the current Map
         * 
         * @param the key to remove from the map
         */
        public function remove(key:String):void
        {
            this[key] = null;
        }
        
        /**
         * Determines if a key exists in the current map
         * 
         * @param  the key in which to determine existance in the map
         * @return true if the key exisits, false if not
         */
        public function containsKey(key:String):Boolean
        {
            return this[key] != null
        }
        
        /**
         * Determines if a value exists in the current map
         * 
         * @param  the value in which to determine existance in the map
         * @return true if the value exisits, false if not
         */
        public function containsValue(value:*):Boolean
        {
            for (var prop:String in this) 
            {
                
                if (this[prop] == value)
                {
                    return true
                }
            }
            return false;
        }
        
        /**
         * Returns a key value from the current Map
         * 
         * @param  the key in which to retrieve the value of
         * @return the value of the specified key
         */
        public function getKey(value:*):String
        {
            for (var prop:String in this) 
            {
                
                if (this[prop] == value)
                {
                    return prop
                }
            }
            return null;
        }
        
        /**
         * Returns a key value from the current Map
         * 
         * @param  the key in which to retrieve the value of
         * @return the value of the specified key
         */
        public function getValue(key:String):*
        {
            if (this[key] != null)
            {
                return this[key];
            }
        }
                
        /**
         * Returns an array of all the keys of this map
         * 
         * @return array of all keys of this map.
         */
        public function keys():Array
        {
            var arr:Array= new Array;
            
            for (var prop:String in this) 
            {
                    arr.push(prop);
            }
            return arr;
        }
        
        /**
         * Returns an array of all the values of this map
         * 
         * @return array of all (non-null) values of this map.
         */
        public function values():Array
        {
            var arr:Array= new Array;
            
            for (var prop:String in this) 
            {
                
                if (this[prop] != null)
                {
                    arr.push(this[prop]);
                }        
            }
            return arr;
        }
        
        /**
         * Returns the size of this map
         * 
         * @return the current size of the map instance
         */
        public function size():int
        {
            var size:int = 0;
            
            for (var prop:String in this) 
            {
                
                if (this[prop] != null)
                {
                    size++;
                }        
            }
            return size;
        }
        
        /**
         * Determines if the current map is empty
         * 
         * @return true if the current map is empty, false if not
         */
        public function isEmpty():Boolean
        {
            var size:int = 0;
            
            for (var prop:String in this) 
            {
                if (this[prop] != null)
                {
                    size++;
                }    
            }    
            return size <= 0;
        }
        
        /**
         * Resets all key / values in map to null
         */
        public function clear():void
        {
            for (var prop:String in this) 
            {    
                this[prop] = null;
            }
        }
    }
}