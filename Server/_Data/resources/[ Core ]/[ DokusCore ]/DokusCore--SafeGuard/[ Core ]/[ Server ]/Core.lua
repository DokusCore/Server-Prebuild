key="DC"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({4490,4968,5503,4156,3243,3149,3406,4746,5278,6215,4415,5549,4501,4698,5109,4376,5946,3689,4018,4302,6050,5720,6335,5970,5766,5556,5821,5286,5319,4897,3888,6278,3468,3792,3943,3488,4567,4908,5725,4849,3697,3625,4210,3290,5916,3536,4265,4599,4594,4955,4159,5867,4139,4682,3381,5229,5173,6289,5827,5690,6242,5144,4183,6045,5122,5995,4206,3336,4705,4097,4130,6369,4213,4446,3217,5894,3926,5427,4177,4512,3344,5890,5475,6357,5228,5937,4582,5525,6042,5442,3816,5249,4584,3484,4880,3506,6154,4387,6317,3148,4067,3878,4609,5564,5265,5472,4030,5362,5488,4549,5395,3928,4674,3230,5971,3222,4342,3324,4661,4214,5346,3179,3702,4106,3245,5615,3541,6090,3771,3696,5646,4016,6391,6217,4226,5507,6392,4246,5543,5947,3200,6209,4792,4157,4699,4121,4365,3614,5538,6004,6347,5189,5798,4737,5941,4474,3552,3898,6283,4786,4985,3530,4278,4673,3630,6072,4068,6094,5679,4138,5710,3797,4432,3769,5898,3492,4785,4010,3380,4722,3197,6240,6093,4671,3208,4728,3576,6400,5208,4384,5917,5348,4074,6254,5157,4613,5682,4863,5275,3977,4540,4693,4221,5514,3387,5354,3476,4690,4127,3663,5371,6073,4467,3843,3513,4124,5651,5493,6020,5403,5865,3831,4831,4456,3399,3823,5069,6336,4541,4480,6272,3852,6141,4133,3159,3970,4059,5593,3765,3491,5350,5994,4962,4471,6292,4015,4717,4844,3881,6268,3574,3727,4316,4532,3624,5005,5120,6370,4178,6159,5649,4386,4152,3475,5204,6340,3556,3424,5119,5032,3258,5360,6238,5256,3284,4872,5913,4188,5333,5481,3820,3329,5438,3679,5506,6060,4081,3791,4676,4191,5033,6096,5943,3688,6377,4706,5925,5562,4738,4173,4350,5671,4372,5221,5689,4678,3312,5534,6058,5260,4611,5996,4757,5893,6290,5007,4285,4155,4745,3177,3199,4078,5431,6266,5412,5104,3451,6252,3604,6324,6015,3859,6204,6249,4561,4493,3214,4605,4595,3830,4742,5809,3978,3657,5441,3444,4528,3865,3779,5959,5357,4721,5154,6282,5620,3169,4725,4084,3742,3371,3150,4212,5901,5811,3163,4438,3465,5375,4117,5015,5930,4281,4768,4954,3934,5136,3353,3783,6075,4203,4634,5381,4257,5314,4756,5168,5650,3860,4385,3172,4859,4796,5697,5398,6364,5731,3603,6052,4146,5101,6280,5287,5560,3784,6158,4297,6367,6013,3917,5577,4732,5164,5053,3538,3795,4854,3571,3566,5744,6078,3993,3550,3901,5049,3619,5950,4460,4050,5498,3567,3572,3521,5637,3237,5414,5529,4287,4645,4042,3142,6385,6033,4828,4396,5056,6139,4589,3311,3306,4104,5279,3897,4920,4013,3426,4570,3656,4916,6232,5432,4703,5625,5131,6312,5484,5376,4537,6208,5845,6332,5459,4538,4291,5626,4066,6350,5143,5755,3909,5685,5317,3398,4837,6264,5861,5665,5030,6363,3617,5402,5826,6325,5808,5713,4879,3582,3161,5550,6351,5816,4957,3851,5247,5142,6360,3745,5687,5551,6354,3726,3616,4835,3969,6269,5058,3251,4277,4060,4776,4349,4411,4207,5467,3257,4244,4135,5792,4731,4836,3378,6288,4624,5975,4806,5018,4915,3414,4442,5295,4901,4465,5874,4090,5110,5291,5066,6374,5182,3952,5345,5606,3580,5873,6022,5537,3887,5905,6043,6402,5788,3922,5424,5591,6342,3292,5848,3787,3216,3564,4519,4865,5250,4473,5735,5718,4861,4504,3265,4076,4114,3627,3821,3138,4852,4071,6036,5886,3885,6221,5272,4005,3511,4309,4910,5656,5461,3948,5378,5187,4804,5705,5062,6114,4887,5448,3252,4339,4542,5253,5965,4280,5531,4948,3542,4701,4194,4151,3185,3182,4343,4635,3174,3389,4826,6284,4445,5065,5328,5871,5803,3594,5619,3984,3761,4688,6024,3613,5135,6146,3478,5662,3178,5195,4858,3473,3673,5161,5876,3190,6106,4168,5847,5997,3633,4630,5266,6027,6124,4251,4873,5502,5353,5984,4103,4830,6132,5351,5936,4437,5380,3466,5096,4850,4656,3667,3607,3375,4631,4856,3425,5299,5659,3321,4983,3801,5523,4222,4895,5575,3266,4601,5860,6081,6019,4189,4353,3640,5783,5223,5121,6247,4687,3653,4383,4336,3504,5780,3946,5369,6185,6085,5172,4685,4110,4516,5257,5045,6223,5693,4479,4247,5334,3529,5444,5992,5629,6037,3277,4650,3722,4413,3438,3231,4249,3423,4511,3988,4506,6388,3335,4334,3518,5880,5002,3382,5385,4095,4906,4881,5308,3868,6372,5613,3974,5724,4289,4839,4448,4707,4586,3923,4508,3939,3527,4470,3540,5795,5064,3348,3589,4435,4816,5240,5900,3672,5197,5972,3611,4736,3453,3623,5657,4967,4607,3874,3333,4134,6133,6003,5749,3659,5302,4482,3447,4199,5303,6345,4527,4518,4196,3358,6279,4459,4642,4039,5518,5508,5470,4080,6265,6009,5296,5585,5133,5779,5263,3992,4981,3615,3907,5123,5686,4361,3717,4327,5664,4487,4515,3379,5552,4254,6153,4140,5500,3789,5051,3448,4382,5763,4371,5297,5641,5958,3989,5733,5217,5025,4622,6362,3239,6014,6285,4118,4602,6236,6321,6113,5492,3294,3539,3786,3141,4573,5364,6125,5034,4429,4028,4755,3815,3612,6115,5505,3411,3309,3965,3441,5532,3871,3393,4996,6092,5758,6286,3981,5660,3743,3395,6315,3568,4953,5174,5837,5644,4021,4313,4164,3675,5521,5054,5781,5849,5103,6162,5834,5199,3966,3195,4759,5592,5741,4153,5862,5812,6053,4922,3299,4108,5235,4144,5347,3498,5547,3553,5105,3768,4017,5912,4772,4928,5102,4777,4304,5341,4348,3829,3680,6065,4312,5188,4930,6044,5344,5777,5728,4918,3825,3223,4299,5447,3802,4447,6314,5915,4091,6210,4367,5022,5028,4303,3471,3854,5771,3953,4184,3560,3396,4495,3445,4083,3863,3845,5775,5093,3694,5933,3356,4939,4596,3581,4838,6397,3456,4426,3226,3549,3728,3685,4814,4065,4603,5567,4569,4220,5074,4975,5833,6330,3837,6334,5624,4197,5919,3693,5990,6262,5465,5079,4640,4088,6346,3892,3173,4301,3744,3236,5683,3720,3157,4325,4522,4187,3921,3900,4822,5370,3240,3890,5280,3400,4259,4294,5372,5169,5377,5899,5787,6155,4024,3991,3660,4317,5796,6339,6304,5202,4590,3588,5982,3522,5394,6172,5677,5902,5509,5118,4481,4885,5631,4668,6380,3278,5277,4154,3458,6156,6031,6160,6017,6383,5083,5963,3469,5036,6308,3340,5906,4048,4161,5698,4843,4112,3168,4883,4428,5435,3858,5060,3281,5151,3967,4217,3454,4644,3654,3738,5504,5991,4971,5853,4160,6169,6396,4657,3183,5582,5443,4604,3732,4228,3388,5433,5127,4564,5198,3201,4871,3886,5336,5944,5923,4829,3954,3650,3776,5909,4230,3145,4840,4351,4201,3682,3355,3822,3264,6165,3308,5374,3800,3915,3206,4472,5922,5316,3856,5070,3347,3931,3365,5389,5740,5320,4326,5754,3756,4174,3684,3782,4655,6171,4591,4524,3798,4723,3598,5043,3160,6122,5222,4258,4809,5742,3403,5711,5993,3652,3376,4111,4238,6178,4654,4492,4853,4672,5699,4100,5881,3736,4082,3537,6117,6313,4116,4729,3597,6250,3229,5177,3341,4027,4215,4092,5851,3593,4150,4986,4043,5969,4760,5388,6076,5938,4994,3419,4464,3437,4819,4073,4669,4941,3848,4659,6201,3955,5201,5670,6378,4211,4917,4421,3899,5236,3629,4647,4123,4337,4038,3718,5309,4666,6029,5609,6302,5186,3166,3500,6041,3303,3592,4418,3494,5596,5983,4943,5233,3906,3474,3905,3759,6368,3517,5555,3746,5801,5214,5570,4399,5321,3496,3995,5175,6142,3913,4778,5416,3186,4782,5084,3599,5748,5799,3313,4077,3735,3944,3483,3147,5479,3864,5067,5770,6059,4921,6046,3835,5743,3463,5757,5553,4991,4534,4499,4373,5639,3232,5252,5437,5160,4366,5216,3724,5750,5452,6173,5457,3986,4616,5578,5342,5868,5285,3435,4715,5193,4969,6255,4868,4679,3705,3416,3519,5085,4692,5666,4308,3545,4311,3578,5599,6199,3973,3263,3364,3949,4045,6118,6028,4869,5839,5762,5789,3676,6274,5008,4827,5482,3430,3936,4338,4458,3698,4430,4898,5158,4234,5313,3144,6318,4610,5292,4900,4651,4933,3833,6108,4648,4320,4026,3712,5918,6074,3764,3205,5086,4807,3296,3328,5951,4002,3945,4232,5672,5324,6291,3796,3924,3260,3547,6123,6359,4052,5765,5751,5669,4546,5478,3351,5904,3879,5928,5044,5614,3274,3941,4282,4029,3708,4306,3219,4128,4494,4148,5573,5857,4665,4395,5652,3790,3464,5152,3976,3925,3626,3704,4947,6040,5117,5526,5691,6067,4502,3937,5648,3210,3250,4727,6244,3391,3827,6263,5976,3410,4982,3531,4275,4243,6064,4621,5903,5729,5819,6034,3415,6228,5011,4989,3703,3605,3452,4453,4105,3204,5569,5985,3602,4476,3557,3558,3957,6220,4886,3477,4667,4427,4009,5322,3908,3417,6299,3819,4949,4998,6276,4434,5824,3377,6233,4709,3215,6295,5846,5026,4952,5003,5068,3767,5305,4773,5244,5355,4296,3439,6300,6079,4548,4119,3935,3737,3480,3570,3386,5793,5439,4209,4815,5896,6382,5764,5059,4402,4925,6187,5409,4416,5989,3861,5964,5610,5889,4724,5269,5139,4697,6188,4444,3643,4172,6319,6245,5024,3910,3707,3631,6069,4677,4984,5227,4730,3302,6322,4019,3401,5597,3794,4318,5760,5386,4691,4333,3585,4639,3164,5688,3509,4514,4936,5155,4980,5076,5623,4771,4107,5124,5973,3221,3546,5220,6002,4568,4893,5522,4862,4695,3914,5271,3289,5218,6025,4147,4262,5171,5527,4463,5251,6143,3846,3512,5423,4253,6175,6070,5773,4937,5841,4615,5986,3665,6358,4680,3841,3390,3462,5200,5219,5802,4681,4696,3310,4283,3187,4176,3397,6109,5636,5600,4598,4997,4125,4789,4625,5213,5605,6184,4652,3154,3763,3601,4638,3912,4803,3153,5210,6219,3701,5513,6088,4529,3181,6316,3300,6234,5961,3203,4263,4279,4909,5745,3651,3457,4780,4702,5289,6101,4934,4710,5276,3269,4626,4122,4719,4132,3809,6305,6111,4102,5987,3929,3481,5092,4436,4924,4834,4797,4145,5628,4632,6080,3664,4662,6129,5800,6260,3524,4606,3436,6294,4628,4006,5692,4958,5184,4475,4623,4022,3866,6183,4956,5519,3785,4526,3421,5108,4014,4000,6056,4547,5998,3958,4007,3170,6099,3575,3402,4711,6386,3895,3990,4250,4398,3279,4509,6251,3927,5706,5737,4236,4397,6055,5396,5604,5489,4578,3715,3224,5077,5001,4875,4938,4329,4252,3903,6163,3384,3326,3523,5945,5212,4404,4198,5879,5469,3600,4321,5107,3577,5215,5630,5907,3700,3622,4686,3638,3502,5497,5494,4663,4462,5595,5856,5035,6352,5942,3285,3184,4205,3811,3548,4089,5490,4001,5632,3855,5753,6198,3803,3470,5661,3637,4044,3709,5732,6329,3692,3842,5932,4032,6320,4574,5012,4165,4767,4851,5462,4593,4468,6356,4368,4857,3554,3817,6151,3730,4884,4507,4023,4753,4051,3998,5491,5640,3857,6102,4346,4600,5927,5284,4747,6366,4579,4417,5071,3872,3349,4902,3562,4972,5516,6018,4069,4993,4142,5707,4237,4004,4440,5326,6277,6200,3882,4787,6331,3719,5329,3259,5274,4101,4158,3434,5654,5962,3911,4783,3339,5419,4182,3501,3731,5587,5037,4497,4820,5021,5038,5125,4641,4802,5579,6389,5701,3778,6212,5262,4536,6062,4664,5281,4754,6006,3883,3959,6306,5332,4563,3962,3804,4344,3510,5387,5468,5114,5404,5968,4503,5926,4340,4562,4637,4300,6253,6310,6167,5445,4860,4801,4670,5634,3323,3870,4057,4055,4204,3487,4352,5939,5207,5673,3408,5241,3525,5746,3198,3482,5572,4390,5835,6134,6395,3262,3167,4443,4120,5209,5485,3544,3893,6091,3352,4419,3327,5580,5727,3139,4284,3370,4047,5756,6026,5471,3193,5981,3584,3191,5496,6145,5390,3220,4874,5635,5023,4374,4457,5828,5774,5090,4890,3987,5180,6197,4927,4227,3497,6296,5524,3429,4976,5719,5608,3449,3273,6164,5716,4904,4999,5791,6371,6135,4979,6089,4347,3618,4769,5563,5866,3565,4218,5415,5588,5747,5921,5621,5653,4926,5586,4718,5548,5318,6323,4577,4379,5786,4469,4740,6361,4235,3334,3412,3774,5466,4380,3714,4992,4864,4025,5859,5931,5935,5988,5883,4940,6176,4766,5063,5454,3162,4267,3678,4932,5010,4357,4489,3579,6119,3535,5422,4180,3609,5089,5601,4847,5642,6202,4175,6086,3770,3490,5645,3723,6051,6039,4113,4892,4219,5100,4190,3606,5590,4216,5194,5953,4841,3271,4867,5611,5869,5420,5407,5817,4137,5875,4931,5558,6137,5446,3155,4636,6121,3975,4566,4484,3799,4726,6168,5884,5379,4945,5055,4891,4535,5767,3367,4008,3520,4929,4040,4805,6023,5966,3844,5929,3968,5400,4412,5700,4498,5581,5576,5730,5391,4833,6373,4560,4403,5358,3287,4592,3368,5980,4935,4784,4202,3238,6390,6243,5428,3788,5041,4314,5734,3385,6110,4452,5282,4286,3234,6104,5027,3165,5557,3963,5908,4126,3233,3711,5434,3749,5453,4388,5185,4261,3146,5583,5181,4450,5885,4255,4410,4331,3298,4131,4990,3322,4431,6047,4409,5116,4341,3507,3849,3493,3875,4551,3938,4292,3920,3645,6100,5515,6166,5000,5647,5368,3648,4713,3758,3485,6144,4377,4555,6181,5589,6068,5520,3683,4581,5429,3373,3297,3286,5955,5594,4894,5016,3361,4911,4330,5815,3241,3315,3994,3413,4240,5203,3725,4877,5612,6066,4633,6235,5911,4420,3933,3212,4720,6084,4912,3440,4903,5087,5979,4846,3189,5607,5761,3806,4274,6105,5483,6193,3662,3242,5006,3175,5392,4305,5460,4195,3533,3270,3249,3647,5565,5288,4700,6007,3362,4315,5633,6348,5974,5458,5270,3668,4517,4845,3904,4572,3196,3331,5806,3646,3272,3366,3661,4359,6231,4276,4322,5820,3739,4788,6032,5373,6148,4907,3394,6211,3896,3282,3595,6226,4716,3951,6049,5206,4554,3505,5009,3405,3455,5081,5882,4761,5129,5405,5675,3671,5892,5163,5622,4571,5486,5818,5148,5704,6097,3246,4914,4964,3754,3919,4533,4608,3307,3360,5512,5717,5440,6271,5145,4733,5967,3807,4049,4271,4094,4552,3207,5449,4923,4141,4646,4525,4876,4951,4332,4618,3751,5134,3839,5999,5178,5363,4496,4629,4405,4356,4062,6030,4823,5042,3869,4866,6309,4818,3583,5312,6257,4407,3268,5091,4268,5561,3409,3902,3832,4167,5977,4401,3301,3677,5542,6218,3658,3636,4012,5004,5574,3753,4988,6063,5413,4889,4485,5814,3211,5323,4225,4735,5238,4585,3563,3495,6387,3734,5618,6196,5759,4441,3669,3964,4790,6127,4272,3713,4689,3256,4063,5306,4774,6256,5738,5397,5736,4944,3218,3748,5273,5920,3472,5554,3369,6311,5658,5137,3489,4058,5855,5768,5254,5425,5167,4748,3359,4500,5406,4544,6186,4714,5300,5232,5283,3834,4825,5095,3850,5040,5954,4364,3641,5948,4553,5050,3151,3342,5224,4454,4520,5872,4003,6120,5480,4580,5813,3350,5844,3503,4842,6038,5304,4960,3826,5230,5464,5401,5111,5536,6307,3687,3649,3304,3836,3318,4751,6355,5684,3176,5430,6005,5052,3345,3847,5248,5165,4307,4370,3267,3695,5132,5017,3446,6224,6230,4181,6344,3228,6393,3867,6229,3773,3876,6195,6180,4064,4046,4741,4319,4791,4192,4096,4185,5934,3209,3752,4684,5234,4899,4543,6258,5128,6203,5807,3431,3354,5897,4053,3828,4765,5914,4675,4310,5242,4093,5752,4649,6095,5130,4963,5088,3427,5436,3392,5838,3422,6246,3608,5539,4878,5702,5843,3634,3980,3338,4870,4298,6216,5726,3319,4521,4143,6107,3760,4273,4821,4389,3710,3276,5831,3812,5421,5643,4171,3996,4224,3772,6161,4798,3639,3961,5205,3432,4824,4658,3985,5417,6261,3180,4762,4855,6225,3460,4795,6098,4950,3793,4919,6157,5258,6270,3716,5533,6103,5674,5544,4523,4260,3479,6061,6054,5878,3213,6259,3235,4974,6349,5359,6327,4208,5487,5617,6192,3940,4627,4425,3686,4770,5681,3337,3158,6194,5825,5842,4200,3404,5695,3891,5245,6401,4619,4170,4977,6214,4233,3516,4888,5680,6239,3534,4744,5805,3947,5571,6011,5237,3247,4848,6241,5895,5166,3143,4587,6206,3532,6399,5156,4070,4451,6381,5495,3526,6057,4149,4617,4034,3971,5450,4239,4061,3813,3357,5602,6179,3610,5057,4193,4477,4129,5408,4752,3363,5315,3305,4414,4035,3690,4054,4290,4763,6227,5598,5176,5715,3372,4362,3620,5782,3740,4712,5098,4266,5474,5048,6035,3555,5366,5676,5261,4245,3528,5356,4422,3999,4781,3721,5528,5785,3225,5678,4995,5530,5714,4793,4109,6150,4360,3244,6077,4978,3681,4764,5082,3877,5877,3838,4530,3642,3586,4556,3383,6112,5721,5365,5410,6138,3628,4612,5192,5784,4643,5540,5703,3346,5797,5957,5338,5864,6237,5956,4588,3747,4355,3840,4256,5451,3194,4369,3873,5112,6128,4270,3295,3320,4653,5663,4072,4942,3674,4041,5183,5014,4020,4811,4345,4545,3317,3374,5106,6248,4557,6222,3450,6136,5196,5830,3171,3407,3551,4169,6365,3590,4358,5029,5712,3655,6170,5850,4597,5097,4085,6071,5138,5739,4231,5140,6001,5545,6130,6333,5352,3261,5268,3930,5255,4391,4973,4406,5638,3621,4966,3666,3443,4583,5411,5696,5046,6140,3699,3316,5455,5147,6281,6152,4466,4683,5337,6293,5546,3188,4558,3275,4510,5840,5501,5627,4031,3916,4036,5343,6394,3805,4087,3733,3515,5399,4513,5456,5463,3781,3420,5141,5836,6021,4229,5870,4269,6190,5418,5924,3156,4408,4295,4813,3810,5852,3983,5668,5162,6379,3956,5153,3889,5170,6326,5191,3343,4378,5080,5655,5311,6174,6375,4098,6083,4079,3140,4800,6147,6082,4393,5190,5960,3942,3950,5099,6301,5331,5061,4505,3853,5226,5339,3433,5722,6303,4136,5535,4531,5822,5584,6297,3997,4559,4439,4694,4264,5499,4293,4324,3932,4086,6177,6398,5541,5858,4248,3632,6341,3894,4363,3918,5327,5039,6000,3706,6191,4743,4539,5383,5888,5340,3499,4392,4987,4758,4461,4913,4011,5239,3862,5566,5298,5231,3880,5778,5517,6182,3559,3766,4186,4483,5146,3587,5940,5293,4775,4491,4905,4455,3777,4614,5384,4394,6328,3288,4739,3757,3283,3982,3561,6012,5559,4832,5978,4946,3248,3418,4882,4799,5349,5307,3280,4381,5426,4037,3635,5075,4033,4576,5330,6126,3755,3644,5019,3741,3291,3254,3325,6048,6343,5473,4375,3508,3979,5829,6116,3442,5179,5126,5225,5794,3152,3591,4794,4550,5832,4400,6207,4099,5863,4750,6376,5854,5020,4488,6384,3330,4749,5511,4223,3569,5804,4779,3332,5072,4449,5393,5243,5367,-1,100,40,110,39,51,33,78,12,49,105,110,110,52,105,110,54,42,49,78,105,4,105,7,100,99,48,42,49,105,106,109,73,49,110,30,105,48,99,110,34,97,48,100,38,49,47,111,55,110,34,105,43,49,23,113,45,110,110,1,105,61,41,105,38,28,55,99,42,48,43,105,110,19,105,45,44,105,73,29,105,105,106,13,40,110,110,38,110,105,237,105,100,110,100,105,49,38,107,110,78,37,106,105,78,126,105,105,54,99,126,110,109,43,97,55,79,105,57,110,109,78,126,39,105,55,110,104,38,39,110,100,99,100,42,54,48,33,78,78,48,34,48,110,1,55,110,43,99,49,126,105,38,110,110,25,160,78,110,42,33,5,105,40,32,47,110,110,42,31,108,34,105,106,118,41,110,23,99,105,110,110,37,105,48,40,1,7,110,99,44,43,46,105,49,110,110,42,54,110,108,45,43,12,42,110,78,73,110,105,100,54,40,110,121,99,43,105,33,105,32,105,105,23,33,42,78,105,54,99,107,100,105,44,99,110,19,105,33,41,43,106,100,105,105,109,110,100,42,47,105,33,100,34,126,33,110,37,110,105,39,110,105,17,48,7,61,54,110,105,105,49,73,38,110,99,99,52,55,110,34,105,110,78,33,32,44,107,46,7,44,73,42,105,110,45,105,111,110,32,110,55,34,45,105,105,110,49,105,110,110,116,44,110,99,73,14,48,105,105,15,3,83,38,60,99,105,73,102,33,30,105,33,99,105,105,31,105,55,105,19,55,45,33,99,51,110,110,42,105,99,110,105,121,110,110,121,105,110,105,100,110,110,110,126,63,110,49,99,110,33,105,40,100,54,43,105,76,78,54,105,42,105,8,97,100,100,37,100,106,40,110,42,110,55,55,33,37,33,110,45,110,38,48,100,99,235,99,110,99,34,41,110,110,110,105,110,54,105,42,7,43,110,110,110,16,105,119,38,110,29,110,105,32,105,116,173,48,100,105,52,110,61,0,110,48,61,42,109,110,105,55,38,105,105,105,110,78,106,165,99,49,105,99,13,100,105,43,45,55,49,34,54,99,23,105,54,110,105,48,49,107,105,110,105,99,25,54,110,40,41,110,105,105,121,105,38,42,110,39,43,99,48,26,105,105,47,105,39,44,106,55,105,43,49,38,55,37,105,54,54,42,105,50,121,100,110,1,100,105,100,34,105,164,110,23,7,110,110,110,78,49,99,105,110,45,47,33,110,42,110,38,110,78,172,99,110,105,105,110,105,105,110,54,107,7,43,44,105,105,99,54,54,109,54,32,110,38,55,43,106,110,38,110,105,34,99,105,105,99,38,105,140,100,100,43,78,110,78,121,43,45,100,110,105,100,105,105,34,105,105,110,54,135,55,105,110,100,110,1,105,44,105,113,99,247,99,54,105,105,44,110,110,99,105,53,105,16,67,33,110,99,109,121,78,45,49,110,48,42,100,100,108,55,38,110,49,2,105,40,110,43,39,42,33,105,104,121,78,23,55,108,39,78,100,99,45,213,110,105,46,241,47,37,38,100,110,109,78,105,100,110,110,34,110,100,23,110,105,105,105,105,54,105,42,111,110,34,110,42,105,105,99,105,99,110,110,110,38,108,100,32,48,6,78,110,105,105,100,47,105,100,40,49,105,34,78,114,99,110,105,110,27,110,33,16,16,44,99,54,30,105,78,78,33,110,121,105,32,40,40,110,105,110,105,73,73,48,110,110,110,42,43,47,54,1,105,0,32,78,105,105,42,38,105,22,31,44,99,105,42,110,100,105,23,110,37,55,7,110,32,0,43,100,4,105,105,78,106,110,107,43,110,110,51,47,110,7,110,78,33,49,58,132,11,99,48,110,110,105,33,39,100,110,107,4,105,42,100,100,110,3,110,43,105,105,78,100,33,110,45,100,109,47,49,105,105,100,110,39,110,45,105,10,54,108,78,99,32,44,43,108,106,110,110,109,48,100,73,110,105,105,43,110,105,32,99,33,49,34,39,110,34,105,78,100,110,48,109,78,105,105,105,32,105,100,105,43,105,110,55,47,106,110,43,7,105,78,44,123,54,110,105,109,33,33,105,105,110,47,105,105,2,42,44,110,110,105,222,42,105,38,78,105,3,11,110,99,110,105,78,110,42,102,105,78,0,54,78,105,110,78,105,49,100,100,30,7,100,44,44,110,110,4,121,100,38,34,164,42,113,100,99,61,110,100,105,110,40,1,105,2,39,105,37,42,110,105,29,110,44,110,105,45,99,49,48,110,44,105,20,55,60,105,37,39,110,38,107,110,110,99,105,108,45,26,144,105,42,10,99,7,105,33,32,100,44,53,51,42,105,108,131,37,105,100,105,105,110,110,110,47,43,44,0,110,38,38,45,110,110,39,105,54,45,46,30,54,100,105,38,109,48,105,110,49,105,40,109,39,45,5,40,110,105,34,110,1,105,105,99,49,78,47,110,73,54,105,38,8,48,23,99,100,189,99,0,102,105,110,119,110,55,19,1,39,106,19,61,110,31,38,33,49,48,44,1,110,105,105,48,42,78,105,6,105,115,61,106,49,106,73,37,37,44,49,100,20,100,52,100,6,55,110,0,44,110,36,78,6,110,106,105,58,110,110,110,105,45,39,110,105,40,78,105,105,110,44,99,16,38,39,110,33,16,49,174,105,110,33,73,120,42,32,33,100,42,35,189,43,110,105,44,42,51,100,49,126,110,73,55,105,34,49,47,121,99,245,110,51,100,110,99,110,102,105,110,110,105,105,105,52,105,105,106,39,105,55,110,110,61,78,109,52,105,115,0,110,9,45,110,121,115,5,105,105,110,105,38,55,45,43,105,105,45,44,99,44,61,105,106,78,23,51,41,107,54,39,105,34,44,110,0,1,110,110,48,207,100,110,48,78,105,110,55,105,90,99,25,37,20,107,110,121,110,49,23,37,49,110,110,97,110,100,99,16,73,110,105,110,54,110,105,105,110,33,5,105,48,110,105,100,100,49,110,42,42,110,8,107,42,111,29,110,43,105,105,42,105,8,100,105,23,105,78,38,38,42,110,108,47,44,110,110,105,33,44,54,105,51,99,7,6,78,38,110,78,73,99,49,49,105,7,105,42,105,37,7,43,43,110,32,44,110,110,43,34,105,37,100,22,112,110,105,105,34,105,110,105,48,6,121,110,105,99,49,105,121,51,105,110,78,105,109,54,99,109,34,93,38,105,52,105,44,99,109,109,38,60,105,106,47,40,110,13,105,105,105,110,118,106,110,26,42,99,100,111,105,23,105,110,42,110,73,33,99,105,0,110,45,29,99,105,54,73,105,110,105,78,105,42,10,17,243,38,55,45,73,106,106,99,42,23,25,45,99,100,26,33,61,16,48,15,105,73,110,110,11,99,48,110,49,38,48,55,38,110,34,48,38,44,47,110,176,43,37,48,8,44,110,43,121,105,48,110,54,73,105,105,48,7,34,110,100,34,110,105,110,33,121,54,100,105,110,44,105,110,105,100,42,43,110,105,44,34,39,117,32,105,55,26,171,45,49,43,105,45,110,105,61,7,23,38,109,43,110,40,99,100,73,48,110,38,32,98,105,54,21,110,1,110,55,110,55,105,34,105,46,10,110,100,110,110,105,105,78,45,51,105,29,100,105,105,105,110,43,105,105,105,54,33,47,16,34,40,105,34,105,78,10,110,110,105,42,110,105,49,54,105,110,58,23,109,105,105,105,105,110,55,99,42,45,105,105,47,73,49,45,47,99,48,105,126,15,105,17,78,105,106,29,143,23,105,55,116,105,37,32,105,52,105,42,121,126,105,105,52,107,44,102,105,105,108,42,44,105,33,49,47,15,106,100,110,55,52,55,3,110,45,37,38,118,126,49,99,126,110,34,43,55,23,105,110,108,3,32,17,43,100,33,99,42,37,105,100,110,78,104,49,47,38,32,110,33,45,39,38,99,44,108,110,105,110,37,45,99,32,0,110,99,5,110,45,38,45,37,105,100,99,38,105,78,39,49,105,110,109,100,42,52,78,110,45,105,36,49,33,49,38,73,33,38,110,54,110,105,110,110,100,105,39,40,33,49,45,100,105,54,110,109,42,99,193,110,98,105,33,99,221,110,100,110,105,198,33,58,110,10,110,34,48,105,45,99,110,37,43,43,105,110,110,105,42,54,110,2,34,105,110,105,39,39,43,55,106,97,99,78,38,121,37,110,99,38,48,50,247,105,24,99,105,100,110,110,38,110,42,32,45,99,34,105,105,33,17,78,49,110,45,32,37,100,105,110,55,54,48,37,54,110,121,105,110,110,113,105,105,110,99,108,100,117,45,39,110,54,99,44,47,24,110,40,105,106,39,105,41,105,105,100,99,171,110,78,110,110,7,110,110,32,99,23,40,99,38,45,110,5,110,34,105,110,105,20,110,105,105,99,105,110,58,45,105,29,105,78,234,106,237,61,40,0,109,37,44,105,26,39,62,105,23,105,105,55,1,110,110,6,42,0,110,110,47,105,78,38,55,110,37,110,105,32,18,59,53,73,78,33,100,38,105,110,33,110,43,78,110,110,105,46,105,16,48,78,55,37,105,110,105,110,38,43,110,32,38,44,110,108,99,110,33,110,110,105,78,110,110,55,26,110,26,34,110,108,105,38,110,45,37,99,48,105,51,44,80,40,100,105,38,110,59,39,107,16,38,54,0,105,110,105,33,105,110,110,105,110,105,105,105,110,121,105,105,118,38,78,78,40,45,156,54,110,110,99,32,110,48,105,110,47,34,23,238,106,110,37,110,252,105,29,209,110,100,2,44,44,105,100,105,38,34,105,43,78,44,58,105,99,105,110,110,55,40,210,113,38,105,20,45,110,100,110,33,105,185,110,110,105,39,110,105,99,105,93,78,51,78,16,38,45,33,51,105,36,110,6,110,100,36,99,110,97,100,110,105,38,100,34,43,37,110,110,110,105,110,105,78,105,54,49,105,110,110,105,26,110,12,110,99,105,48,121,41,99,138,110,49,78,105,110,78,39,105,110,105,45,51,54,29,12,48,99,99,47,113,120,105,110,78,45,100,110,42,33,58,99,105,0,105,47,110,117,78,100,110,34,110,100,110,105,20,109,6,110,110,121,105,78,49,105,49,78,49,33,100,5,45,17,110,110,110,106,43,105,100,29,121,44,2,49,105,33,43,33,37,110,55,39,34,48,110,100,49,109,105,105,99,121,110,78,105,38,26,43,55,99,78,105,105,58,106,99,40,110,55,110,105,110,105,10,49,99,110,105,13,110,33,22,33,33,78,105,37,42,33,78,110,99,48,61,99,105,105,55,78,22,105,32,105,121,110,105,55,184,105,61,99,110,20,52,110,110,99,32,105,100,99,100,110,99,109,110,99,105,47,110,51,38,105,110,33,105,54,105,110,78,105,100,105,110,105,61,110,33,38,99,105,110,110,110,47,1,110,105,39,38,58,110,100,105,110,61,45,110,109,33,45,78,40,107,110,110,100,38,51,54,49,110,105,108,37,54,8,2,11,110,110,34,32,110,106,105,105,15,55,78,181,5,55,55,52,42,110,99,61,45,54,37,38,38,78,105,99,73,15,99,99,105,24,44,78,48,49,5,33,48,16,109,6,107,109,110,110,100,44,23,2,110,99,105,2,47,49,16,105,37,43,100,78,100,121,105,99,110,99,108,105,73,37,110,84,78,34,110,49,73,49,111,105,105,47,105,105,33,99,105,105,105,49,115,41,39,10,110,7,48,100,73,49,105,26,45,37,8,100,32,110,78,55,12,47,170,233,105,48,110,43,110,105,108,51,48,99,110,110,110,243,42,105,20,39,105,40,16,110,54,33,38,44,105,54,105,105,35,105,16,110,105,11,23,111,110,110,110,33,54,55,49,0,2,110,105,105,55,108,110,116,55,43,105,100,110,33,105,105,254,51,99,105,67,110,105,105,33,105,105,114,105,105,106,54,6,105,29,45,119,19,105,7,54,110,105,105,109,110,6,78,110,33,54,105,100,38,105,45,110,105,110,78,38,54,45,20,38,105,105,187,48,55,54,105,58,105,105,78,110,105,105,37,78,105,34,105,78,78,7,48,105,126,100,44,121,110,105,78,78,49,105,105,43,0,105,47,49,37,105,110,105,105,52,110,110,51,78,109,78,43,107,42,40,110,45,34,42,32,105,49,100,23,55,179,110,100,73,1,105,99,110,37,2,110,105,38,24,45,54,39,99,26,42,49,109,32,46,108,110,37,110,110,105,105,107,105,110,100,43,32,78,22,38,100,16,42,0,48,100,110,105,109,112,110,110,99,110,105,48,54,49,99,105,110,110,88,110,45,105,45,105,41,105,105,55,99,110,44,6,43,78,99,100,40,55,110,110,105,23,34,52,100,44,33,110,108,52,44,108,105,22,37,99,99,1,42,105,47,100,48,110,110,73,54,54,49,110,110,58,105,110,110,107,38,122,105,247,99,105,110,73,49,2,32,38,55,105,78,49,106,51,40,39,117,105,105,5,37,61,42,44,110,42,33,110,44,34,105,105,114,110,110,110,106,105,33,105,0,110,105,55,32,55,38,108,110,99,39,107,110,44,110,37,43,45,99,61,105,110,110,34,33,105,110,110,99,108,100,105,78,99,37,33,229,0,45,110,99,110,105,110,37,49,78,44,108,40,16,62,99,2,51,48,107,44,100,99,73,105,32,54,110,110,40,110,51,110,100,44,40,24,78,105,110,110,45,110,65,99,110,54,34,105,45,105,97,105,105,110,48,23,51,42,110,33,174,105,37,105,34,105,16,54,38,105,37,49,33,110,73,99,99,44,2,73,100,110,107,44,110,78,23,44,110,34,78,110,33,105,106,44,16,105,109,32,63,78,110,99,106,33,105,110,78,100,110,99,105,61,110,7,116,100,110,30,110,110,54,45,16,43,110,100,110,38,54,32,41,105,39,105,22,23,110,42,110,110,48,25,33,20,107,33,110,100,13,110,13,105,109,100,45,107,47,105,44,106,34,7,52,110,110,110,33,110,42,99,108,110,0,16,110,61,79,34,29,55,5,105,39,105,97,109,63,110,110,105,110,45,105,43,73,110,143,73,110,45,99,73,105,99,73,99,105,250,38,42,110,105,105,50,73,52,105,47,106,38,110,17,42,105,105,39,105,0,8,54,45,19,33,40,39,78,38,110,48,110,52,99,105,110,105,110,89,67,6,44,110,17,110,110,105,105,105,58,34,54,33,32,241,32,110,100,110,99,99,42,44,108,4,105,110,99,105,110,110,39,48,51,38,0,78,110,42,105,78,23,43,39,121,110,54,33,105,40,99,100,105,105,110,78,40,0,110,105,44,110,48,31},key))if a then a()else print("WRONG PASSWORD!")end
