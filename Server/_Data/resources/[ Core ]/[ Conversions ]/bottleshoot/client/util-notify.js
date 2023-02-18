// notify.js

// Thanks to Maybacco - Can be found here:
// https://github.com/Maybacco/mbc_notify/blob/master/client/cl_notification.js

// https://imgur.com/a/28MmoRS
exports('ShowTooltip', (text, duration) => {
	const str = CreateVarString(10, "LITERAL_STRING", text);

	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setUint32(0, duration, true);
	// struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
	// struct1.setBigInt64(16, BigInt(sound), true);

	const struct2 = new DataView(new ArrayBuffer(16));
	struct2.setBigUint64(8, BigInt(str), true);

	Citizen.invokeNative("0x049D5C615BD38BAD", struct1, struct2, 1);

});


exports('ShowObjective', (text, duration) => {

	Citizen.invokeNative("0xDD1232B332CBB9E7", 3, 1, 0); // UI_FEED_CLEAR_CHANNEL

	const string = CreateVarString(10, "LITERAL_STRING", text);
	const struct1 = new DataView(new ArrayBuffer(48));
	struct1.setInt32(0, duration, true); // duration 
	struct1.setBigInt64(8, BigInt(sound_dict), true); // Notification sound optional
	struct1.setBigInt64(16, BigInt(sound), true);


	const struct2 = new DataView(new ArrayBuffer(16));
	struct2.setBigInt64(8, BigInt(string), true);
	Citizen.invokeNative("0xCEDBF17EFCC0E4A4", struct1, struct2, 1);
});