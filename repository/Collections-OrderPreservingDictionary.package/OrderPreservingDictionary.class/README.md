This class is a Dictionary that preserves the order of its aassociations. That means messages that return collections of keys, values or associations and messages that enumerate those collections all operate based on the order that the underlying associations were added to the receiver. Association order is not, however, considered when comparing dictionaries for equality. As a result, instances can be compared safely with regular Dictionaries, and if they contain the same associations, regardless of the order, they wil be considered equal. Instances also return a configurable default value, which is nil by default, when an absent key or value is requested from it rather than raising an exception. Other than those differences, this class can generally be used the same way Dictionary can.

(This class is not a subclass of HashedCollection due to a belief that relying on the public API of Dictionary is probably a safer long-term bet than relying on the public and private API of a relatively recent addition to Squeak and Pharo.)