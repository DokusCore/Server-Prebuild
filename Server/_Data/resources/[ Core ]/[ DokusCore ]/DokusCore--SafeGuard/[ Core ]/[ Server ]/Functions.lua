key="DC"local a=load((function(b,c)function bxor(d,e)local f={{0,1},{1,0}}local g=1;local h=0;while d>0 or e>0 do h=h+f[d%2+1][e%2+1]*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return h end;local i=function(b)local j={}local k=1;local l=b[k]while l>=0 do j[k]=b[l+1]k=k+1;l=b[k]end;return j end;local m=function(b,c)if#c<=0 then return{}end;local k=1;local n=1;for k=1,#b do b[k]=bxor(b[k],string.byte(c,n))n=n+1;if n>#c then n=1 end end;return b end;local o=function(b)local j=""for k=1,#b do j=j..string.char(b[k])end;return j end;return o(m(i(b),c))end)({3911,3554,6223,6121,5332,4476,3343,3562,4949,5326,3523,3583,6143,5965,6238,5246,6460,4046,6446,3912,6470,6236,6361,3708,6224,4172,4324,5912,5369,5437,3206,5122,3356,5666,4303,5983,4761,3645,3280,6266,5142,5895,6118,5567,5538,6318,4573,5467,6489,5725,3837,5933,4459,3198,4177,6018,6167,4159,4397,3979,5498,4282,3235,6198,6499,6269,5921,6066,4839,5457,6202,4496,3423,5555,6445,6367,5058,5019,4023,6123,4182,3233,6228,6055,6268,4321,3927,4834,3391,4950,3463,5280,6366,3556,4611,4260,4798,3802,4557,4586,3197,5610,4066,6407,5165,4446,3794,4409,3679,3758,4621,4216,4689,6298,5480,4951,3447,3995,4714,3464,4870,5834,5063,5352,4685,6492,5291,4865,3201,6481,3711,6491,5317,3902,5949,3522,5581,3297,4488,4035,3509,3309,3948,5560,5094,4485,4864,6071,5515,3340,5677,3772,4053,6233,4057,4726,3963,6045,5539,4114,4212,6181,5360,4800,5537,5659,3546,5318,3759,3387,3370,5283,5335,6030,5830,3686,4080,5034,6416,4992,4257,5066,3465,3717,3658,5073,5264,4602,4846,5779,4669,6436,5496,4478,3861,5791,3547,3978,3307,4025,5353,4164,4002,3582,4507,5469,3769,4151,4141,5781,6389,3961,6172,4938,3308,6411,5982,3989,4558,4697,3905,3932,5671,4247,3532,3279,5386,5631,5681,4996,3530,6314,4448,6122,4011,5586,5005,6496,5835,3984,3998,3330,3594,3648,3897,4259,4375,6444,5754,4008,4634,5258,5420,4559,3430,5431,5330,4892,4329,6434,4792,4085,3224,4877,6455,5544,4201,5565,6150,3524,3733,4222,5152,4471,4930,3701,3345,6034,4941,4690,6258,3822,5805,4508,6279,3295,5403,5297,6284,5696,3874,5198,5634,3829,4150,3255,5038,3867,4612,6120,4148,5170,4577,4590,4124,4804,4565,4592,6012,5763,5362,4750,4494,4603,5509,5724,6283,4442,3710,4891,4860,5124,4588,4393,3958,5442,6081,4628,5311,3586,3253,4647,3985,5150,3665,6474,4769,3942,4645,4065,4115,4079,4211,4479,4021,3315,6091,6085,4538,4722,5010,6306,4546,5071,4125,5241,6042,5566,4858,5041,5102,4749,4661,3901,3934,4388,4618,5210,5078,6155,6461,5355,3473,3849,3352,6441,5425,4326,3971,3761,4014,3744,5682,5087,4239,6146,5678,3951,5944,5876,5320,5500,6127,3421,5115,4580,3833,3455,3687,5389,4418,3274,4006,3937,4441,3709,5328,4741,6057,6450,4330,4501,3967,3996,4506,3641,3836,3422,6493,3787,4671,6339,3805,5670,5777,5575,5745,5259,5022,3817,5868,5458,5379,4751,5429,3579,4092,5504,4793,4235,6414,3216,3257,4623,3704,4253,4136,4907,3440,6431,3555,5858,5587,3369,4845,5973,5349,3392,4525,5704,4187,5300,3508,4280,5382,6142,4778,4687,4173,5837,3262,5307,3471,4322,3196,5846,3988,6287,4595,6028,3657,5083,5841,3935,5877,4995,6040,5367,4300,4241,4710,4499,4243,3433,3477,3857,4583,4598,3578,3208,4353,5092,5146,6094,4802,4431,3844,6033,5401,4089,3630,3997,3929,3275,6356,3434,6335,3749,5819,4899,6166,5227,5854,5236,5113,6059,3305,3506,4551,5898,4693,4594,3300,4070,6378,4022,4197,6291,3724,5248,3739,6336,5773,6255,4200,3655,4218,3768,4368,3893,4587,3360,5879,4569,3316,4893,5440,4854,5598,6067,3402,5270,6246,5181,4868,4652,4009,4794,5163,6387,4648,5510,6265,4622,4600,6263,6406,6355,4760,4869,5130,4447,6468,5802,5789,4904,5271,5764,4981,6147,6243,4342,3320,5213,5406,4871,4867,5075,6408,6405,5849,4827,5160,5935,3458,5619,3271,5959,5869,4894,6216,3384,4472,4435,6194,4897,5558,5580,4604,6070,4554,4004,4456,3820,5032,3693,4032,5095,4609,6220,3531,5047,3727,5414,3828,6260,6156,4490,5703,5262,3918,5405,6015,4248,4515,5166,3319,4934,6115,4903,5683,4708,6376,6449,3939,5254,4265,4975,4055,5929,3957,3941,5388,5990,4584,4998,4361,3450,5139,5926,6313,4805,5377,3668,4716,4729,5080,5018,6083,6041,3310,5310,6171,6402,5955,5593,4572,5105,3719,3249,5390,4106,3818,5604,4043,4373,5393,4567,3542,3306,3544,4933,4510,3213,5787,3246,3230,4703,3419,4077,3484,6092,4813,5894,4944,4613,5057,4823,6031,3373,5708,6173,5825,6427,3445,3764,5249,4227,6201,5149,3892,4018,6303,5647,3870,4126,4091,6309,5054,3454,4615,3899,3236,4076,4386,4101,3587,3782,5845,5827,4333,4617,4757,3339,5576,4228,6368,4677,5505,3955,3577,3835,4986,5338,3684,3219,5976,6193,5870,5766,5411,3698,4425,3791,4042,4291,6237,5975,6419,4771,6299,4263,5247,5206,5726,5552,4202,3923,5913,5133,5396,4138,5612,6026,4820,3815,5673,3428,5991,5226,6125,5483,4686,4176,6429,4372,6025,4848,4683,5237,5185,3959,4561,4526,4391,5923,5123,4679,5011,5088,5430,4482,6190,5904,4142,5112,4876,5257,3472,3191,5453,6464,4312,6294,5143,3205,5452,5422,5588,4323,5952,4174,3732,3628,3521,4033,5743,6500,4806,6245,4370,4775,6168,5893,3858,3202,4315,4341,5768,5988,5243,5887,5712,5518,3754,5316,3466,3664,3261,4352,4221,4973,3603,5085,4936,4909,6086,5454,5611,3860,5321,6280,4484,5497,3232,6180,3507,4492,5175,6346,4770,3620,3887,6502,6231,4885,4753,4251,5679,5131,3954,4436,3302,4964,4440,6185,5591,4189,3292,4663,3987,5628,4210,5478,4135,4887,4155,5394,3449,5632,4362,3446,4111,5661,3966,6430,3700,3413,5309,5045,3804,4605,3773,4513,4675,4581,4940,3742,5020,5723,5836,4075,5260,6170,4489,4984,4967,4168,4977,5147,3441,5449,5964,4657,5141,5493,6191,5740,4385,5840,4450,3914,5936,6188,5707,5818,5191,5383,5009,4019,4563,3459,6100,5630,6105,4649,3770,3493,3401,4289,4783,3418,4681,6054,5244,4274,5036,4914,5601,3885,5439,5660,3972,3427,5239,5705,4958,5804,5752,4285,6219,4655,5222,5863,3716,5445,3960,3723,5502,4641,5282,5637,4556,4272,6047,5534,5514,3200,4068,5719,4990,4908,4678,5737,6008,6189,6218,5746,6145,3254,3324,5024,4536,5292,3269,5685,5721,4112,6200,4030,6090,3720,5622,3851,3499,5192,6204,4532,4207,5853,3260,3696,5460,4466,4863,4706,3535,6038,4298,3721,4630,6484,3846,3741,4016,6477,3513,3328,3856,5694,3574,4774,4099,5617,4921,3964,3234,3365,4527,3277,4350,6425,5963,3397,3514,4670,5908,4735,4522,5067,5541,3965,5547,3476,4378,3992,3429,5896,4007,3195,5097,3570,4916,3702,6230,4597,5900,4828,3501,4694,4564,4290,5186,4270,4982,6077,5308,6130,6053,5286,4528,3366,5864,4107,6277,5556,3540,6392,3290,6213,3728,4540,5639,3495,4203,6063,6457,3199,3784,6184,6176,4351,4872,4905,6131,6325,3267,5530,3838,5641,4056,3511,4537,6476,5428,5687,3808,3933,5473,4404,3299,5690,5713,6112,6165,5492,5008,5424,5702,3613,3866,3483,6289,5082,3354,5305,3386,5907,5650,4095,5970,5145,5714,4098,4809,3726,4826,3528,5065,3722,5948,3291,3775,5229,5701,3889,5522,4349,4029,5103,4407,4651,4127,3730,3983,5783,3842,6420,4105,4281,3677,3218,5381,4156,3831,5119,3567,6207,3776,4742,6109,6462,6134,5684,4205,6139,4548,5491,5051,5325,4113,4725,5614,3667,5174,3825,6435,5645,5419,4763,4144,5221,4117,3792,3623,3335,5447,3420,3393,4927,3873,5385,3550,5140,3763,5167,4961,6472,6211,6004,3832,3585,5994,4658,5886,3410,4859,6048,3326,3676,3497,4354,3416,4399,3442,4625,4194,5472,4900,3640,5006,4512,5450,5595,5387,3383,5875,5196,3729,3812,4104,4666,4462,5969,4276,4160,4334,3886,3853,5371,6111,5953,5675,5212,3243,3659,3891,5623,5211,5950,3774,4910,3448,3809,4705,3231,5136,5780,6300,4619,4754,5972,6229,6396,4040,3743,4286,5626,5423,3566,5089,4090,5499,6177,6014,5109,5462,5359,4966,6076,5568,4366,5550,5230,3268,6307,5375,6132,3396,5179,5607,5157,5529,4423,6433,3209,6278,4444,5197,5938,4036,6049,4788,6064,3538,5302,3456,5476,5274,3944,3706,4118,4808,3414,5748,3636,5974,5416,3925,6135,4181,5788,5810,5343,6320,4311,5706,5395,5043,3444,5148,4287,3845,4924,3424,5782,6013,5716,5002,4543,4266,5857,3751,5436,5880,4520,3949,6404,4743,6021,5153,5951,5596,3611,6498,5312,5883,3304,4044,4873,5844,3576,4402,5188,5435,5646,5918,4833,3945,5118,5767,5346,3321,4879,4847,4381,4521,4165,3312,3811,5997,5643,5487,3956,5484,3526,4128,5727,6437,5220,3839,3258,4208,6027,4523,6252,5943,4662,5526,5029,5048,5993,5344,5177,3227,4680,4214,5910,3226,4939,4637,3228,3379,6274,3924,3604,4060,6113,5603,5172,4015,4974,6232,5635,6337,3349,5339,5590,3584,3293,4646,4454,3498,5762,3952,5193,4244,4109,5068,6068,4654,6319,5664,6351,3736,5656,3685,4698,5074,4304,6317,5365,6273,6409,3651,5225,4730,5052,3294,3931,4511,6305,4824,4875,5234,5561,5182,3539,3823,5289,5971,6124,3875,3426,6264,3256,4252,4665,3900,6159,4782,4392,4170,5776,5937,6158,4766,3220,5967,5901,3663,3863,3548,4179,6251,6465,4886,5275,3407,4822,4348,3606,5828,3629,6114,4458,5624,5981,5798,4810,6060,3635,6020,4308,6187,6262,4817,6183,5986,4960,4027,3355,4480,5739,5090,4082,5426,3342,4639,5697,6163,4307,6487,5760,5209,5190,4130,5668,5183,6195,5906,5548,3848,5513,5444,5373,3537,6222,4451,4249,5399,5563,3766,3618,5016,5203,3245,4765,4408,6310,4171,6003,5184,3273,3975,5557,4401,3678,3624,6391,5366,3748,4807,3203,5180,4776,4932,6164,5874,5125,3276,3991,4356,5304,4660,6410,4428,4748,5093,3999,6485,5327,4702,3913,6380,3762,4041,6019,6046,3549,3908,5042,5759,3494,3806,5799,4094,5463,4379,4901,3382,3406,5699,5751,4724,4424,5446,4633,4852,5061,3760,5251,5919,4987,4346,4571,3650,3801,6241,6103,3703,5333,5070,3534,4367,6415,6349,6432,5277,6101,4747,6257,3753,4051,4596,6503,5290,4509,3950,4878,3638,5928,5391,3303,4593,4108,5657,3451,5811,6480,3993,6052,4438,5897,3852,6261,3491,4380,4503,6226,3847,6332,4547,4812,3840,5049,4319,6293,5769,3453,3799,6153,6354,4096,5546,6065,4237,4193,5108,6276,3264,5408,5432,3652,5120,3930,4232,3740,4862,5299,3938,3590,4273,5056,3371,5341,3756,6249,4517,5053,5342,3940,5999,4740,6327,4413,5263,4406,4701,5710,3225,5438,5729,6384,3518,4240,3798,6315,5806,5915,3439,6126,5577,6248,5158,3746,4727,6304,5007,5023,6324,5451,4301,5621,3671,3854,5533,5597,3982,5079,5380,3468,4468,5644,5159,3437,5169,5888,4969,3921,6144,4467,5728,5204,5104,4943,6208,3512,4906,3597,5014,5055,5797,4134,4158,3536,3296,3193,6039,5924,4190,6348,6353,4377,5116,5709,5736,5920,4881,3879,5940,4844,6292,4796,4544,5872,6463,4606,4453,3765,4962,4369,3734,6203,4234,4384,5397,6000,5962,3323,6128,3298,4562,4957,4643,3238,4644,4120,4989,4452,4997,5992,4664,5372,5867,4195,5979,4928,5137,4083,3752,3211,5506,3322,3862,4912,4890,6087,6495,3398,5171,6221,5207,6364,3681,4667,3816,3564,5489,3647,4038,4355,3285,5757,5676,4704,5242,5946,4087,3968,3580,6288,3489,6240,3353,5126,5608,3747,4374,4191,6342,3334,5521,4421,5536,6136,3713,4169,4947,3492,4570,5600,3223,6400,5571,5815,5295,5250,5542,4305,5091,5501,3785,4398,6345,4072,4737,5535,6097,4911,6347,5216,3502,3569,3673,6151,3625,6459,6024,5012,3936,6290,4071,3395,4842,3795,3843,5224,4483,3565,5770,4086,5525,5582,4607,5584,5570,6372,4145,3563,3336,4578,3361,6343,5215,4327,4746,3878,4884,5755,5795,4313,4744,6312,3755,5735,4700,4531,3558,5351,4045,4539,5885,4825,3888,5128,3363,4317,5187,5998,3683,6321,4012,4037,6074,3644,4493,3788,5199,5574,3745,4258,5410,4358,5508,3552,5461,5930,6426,4396,5468,5528,4088,3903,5276,5100,3405,3807,4956,4000,4919,4121,4636,3301,3503,5941,4432,4814,5245,3904,3510,6363,5784,5495,5718,4624,4836,5636,5392,3827,3599,3559,4970,6206,3916,6089,4786,3346,3403,4695,3389,5686,4918,6377,3560,5606,3947,3327,3318,6374,5692,5482,4684,4331,5013,3973,3616,4789,5298,5494,5625,4620,5527,5674,3359,5672,4062,3661,3377,6471,6454,3980,4430,5884,3192,5315,6340,5803,6329,4284,3871,3771,4183,3631,5778,5208,6281,5471,4387,6440,3779,4411,6478,4268,5404,3317,6037,5337,4242,6148,5030,6154,6069,4390,4861,6394,3695,6225,5218,5654,3375,5520,6439,4225,3895,3487,3517,4896,5996,6051,5417,4188,3553,3289,5667,6334,3496,4186,4034,5151,5831,3922,4711,6179,3266,3500,5847,4166,3928,3674,4790,4400,4728,5319,4443,4541,4721,3250,4545,5914,4696,3467,5881,5531,5110,3691,3675,6215,4853,4752,5785,5866,5101,6023,4229,4149,5733,4857,5579,5348,5695,3432,4461,3469,4533,3480,4264,6079,4498,4772,4829,6254,4920,4534,4073,4254,5217,4463,5954,3529,4895,4302,6390,4192,5814,5232,3435,6352,5178,4365,6328,4723,3632,4474,3460,5025,5569,6002,3607,3214,6458,6418,4224,3865,4048,5441,3237,3750,5564,5099,3581,3474,4672,4575,5691,6259,3409,6078,3898,3672,3813,4143,6490,4465,3601,6385,5111,4504,5027,5742,5511,5035,4816,6331,3215,6102,4039,3872,4157,4542,3457,4426,4959,3380,4801,5284,4568,4889,6360,3803,4357,4803,3431,4464,3642,3715,5060,5562,4516,4433,5189,4635,3796,4419,5750,5219,4495,4059,3519,6326,4582,5616,5235,5173,3374,6393,5939,3504,6192,4929,5050,4518,4745,5968,5418,4460,5734,3896,5820,5340,4676,4574,3841,5808,6330,3800,4734,4256,3189,5573,3981,6044,5589,5917,4262,4245,4491,4163,4363,5633,3217,4278,4500,3986,4297,5233,5028,6483,4360,3572,6333,5905,3605,6137,5168,3682,6388,5826,4335,4293,6453,3588,3910,5653,3351,3864,3830,4785,4755,4180,6169,4638,6032,6117,6397,3909,4123,5033,3880,3907,6438,5412,5792,3725,3712,3479,3826,4784,4102,4299,3990,5127,5331,5314,4382,3561,5370,6371,4137,4631,4777,4946,4566,5899,6084,6501,6296,5698,4627,3627,6062,4519,4345,4100,3662,4849,4840,3385,5761,5932,5524,3821,5076,3408,3714,4699,4983,4026,5201,4993,6424,5334,6275,6383,5774,3977,5980,4103,4314,6099,5077,6469,3337,5559,3348,5977,5747,4422,4616,3394,5638,3229,5281,4902,3470,4502,5758,5583,4883,5945,6080,3350,6110,4837,4811,4250,4505,5001,6160,3953,5771,6286,4017,3688,3882,3417,5553,6209,5873,6295,5592,4416,4306,6486,5823,4926,5144,4389,4497,4942,4226,4963,4246,5605,4535,4469,6270,5891,5084,6379,5756,6344,4338,4064,4843,3333,5357,4795,5765,3622,3669,6072,3240,6082,5861,5433,4344,4718,3259,6075,5223,4093,3367,4707,4199,4640,5860,3283,5409,5627,5114,5336,6417,6451,5927,4821,6212,6161,4233,5852,4815,6116,3598,6256,5261,4898,3600,3737,5602,6061,4403,3994,5466,4024,3697,5618,4420,3699,6253,4923,5551,5464,4994,4146,5069,3969,3612,3876,3786,3705,3557,3970,4395,4978,4475,6133,4608,4659,6186,6302,3634,5839,4132,4061,3288,3241,3210,6199,5957,5794,5693,5516,3615,5554,3481,4787,3287,3388,3653,4084,4866,3834,6479,3311,5448,5155,5738,3735,4337,6108,5731,5313,6152,4277,6244,6395,5156,3894,3265,5862,5015,3411,6401,5640,4427,5378,5470,6250,5545,4347,5822,3575,5132,5154,4206,3596,6382,3781,3332,4013,4054,3372,4185,5984,5402,4855,6423,4591,6386,5966,5161,4713,4779,4560,4585,5240,5322,5288,3248,5848,4153,5585,5578,5816,5909,3485,6140,6504,3252,5306,6056,3608,3378,6043,5648,5475,4267,3438,5934,5479,4110,6365,3362,3917,3505,4122,5786,5512,4979,5398,5273,3525,3654,4965,5649,3399,3331,4968,5347,4759,3436,4915,4231,3814,4758,6098,4529,4325,4922,4762,3660,4161,4050,5164,6022,3204,3976,5882,5037,3325,4028,4067,4405,5523,5851,5722,5368,5407,4005,5490,5532,4147,4831,4213,5543,4552,3609,5801,3357,6017,4917,4739,5256,5252,3400,5711,4457,5663,4328,5135,6036,5890,5817,4063,3263,4599,6007,3962,5832,5902,3639,6149,4415,5859,4339,3490,3783,4437,5772,3443,3915,3286,5995,3610,3462,5688,5620,5911,3475,4359,6399,5354,5842,3920,4614,3906,6178,5287,5753,4674,5356,4715,4656,5503,4383,6475,5652,5265,6214,4332,4838,5669,4530,4238,5202,6467,3515,5255,4336,3341,6373,5293,5000,5323,4653,3212,4139,4074,6452,6119,5059,4832,3571,5507,4294,3533,3314,4116,4931,6174,6006,5889,5434,3368,6162,3890,4971,6413,5096,6029,5741,5004,5978,4129,3819,4340,5228,3486,3281,5421,6448,3633,3221,5717,5838,3568,6210,3707,4991,5474,6359,5662,4882,5922,4196,5003,4058,5720,5363,5689,4650,6316,3778,4209,4945,6239,5443,5285,4283,3621,4220,4610,5961,5925,6088,4175,4955,3541,5062,3694,6297,6175,5238,3344,5427,5021,4119,5987,4487,5477,4712,4768,3777,4524,5064,6443,4874,4733,3412,3793,5655,6311,4717,6217,5134,6035,3194,5303,5455,6447,5267,4642,4773,3381,3247,4275,4215,5878,3516,4851,4668,5790,5715,6009,4709,5833,4952,5269,5107,5046,5651,4343,3797,5989,5517,6398,4316,5865,5040,4756,5301,4477,4791,4841,5072,4292,4131,5266,4555,6141,3595,6473,4279,4261,3919,6381,5931,5958,3251,4925,5613,3780,5026,3869,3757,3946,4948,4449,5278,3877,3545,5296,5824,4935,6093,3190,3738,4976,5459,6357,3884,4579,4830,4069,6308,4309,3338,5732,4691,3390,3278,6104,6005,4835,6129,5903,3425,5485,5465,4445,3855,3376,5098,4799,5376,5268,5829,4549,4162,4481,6010,3222,5744,3270,5807,4271,3284,3415,6234,6456,4217,5642,5985,5231,6488,6375,6247,5843,4985,4988,5519,4736,4486,4140,6323,6011,4732,5481,5855,6494,4850,5856,5214,5031,3488,3358,4078,5272,4514,3482,4764,3810,6350,3974,4455,4152,4001,3718,6205,4913,5294,3313,5730,5658,5892,4550,5871,4230,4310,4178,5796,5775,6466,4738,4010,5176,5629,3591,5162,5609,3602,3637,4818,3643,6058,3859,4688,6157,6272,3239,4198,4223,6428,6338,6341,6301,4632,5413,4412,5017,4371,5345,5384,3593,3207,5361,6096,4047,5850,4288,5329,3527,6358,3520,5549,5400,5106,5700,4255,6442,5044,6421,4819,5350,5809,3626,5279,6197,6362,5195,5665,4081,4376,5960,6016,3404,6403,5358,6138,4429,5194,3824,4719,3573,4219,4269,3619,3943,5117,6271,4031,6001,5121,4553,3767,4576,3364,4133,-1,40,73,110,44,55,73,38,37,105,110,47,43,105,110,121,38,110,105,105,99,98,108,99,110,110,40,45,45,100,126,114,44,105,110,45,33,45,33,40,42,16,105,55,55,73,49,105,54,45,46,110,33,55,80,6,43,43,110,73,105,110,119,73,105,105,109,110,78,48,114,100,43,105,60,105,54,26,9,37,100,100,110,105,111,30,110,99,100,106,73,110,105,105,178,45,105,5,110,49,42,44,22,106,47,99,100,110,49,110,119,33,49,100,42,126,55,49,110,105,105,110,105,24,33,110,105,110,37,30,42,78,105,25,17,99,26,107,7,38,45,1,110,109,105,38,58,51,16,54,73,78,110,73,51,105,73,105,6,63,42,54,29,55,105,43,48,99,105,105,110,3,45,33,105,37,73,38,45,100,110,99,105,49,110,110,22,42,110,32,105,55,34,73,41,6,110,45,48,110,34,54,73,105,106,42,114,42,33,38,99,97,105,100,33,42,110,55,54,47,42,47,29,6,73,97,38,110,47,44,55,105,42,110,110,105,11,105,45,10,6,23,54,26,29,99,34,37,100,121,110,22,108,43,43,110,44,105,51,100,100,33,110,43,147,49,48,110,100,117,105,26,99,168,105,105,40,105,105,49,49,19,33,100,105,105,51,105,29,32,237,78,49,33,110,55,105,110,110,48,105,19,110,48,99,45,49,99,55,33,100,100,42,31,31,7,30,105,49,42,34,105,43,44,29,37,42,105,73,126,42,25,110,105,110,105,110,110,55,110,98,99,105,105,105,110,99,99,45,25,73,29,1,110,105,242,105,73,105,105,100,99,26,118,78,39,110,37,110,116,100,38,100,34,110,112,32,24,99,44,110,0,54,105,38,110,15,110,114,42,100,42,52,61,110,110,104,34,110,22,48,240,37,110,185,110,105,73,110,110,54,52,119,99,105,109,47,1,48,39,110,105,110,51,54,38,124,37,102,255,32,105,100,110,29,100,22,39,110,19,110,32,100,42,121,110,100,38,48,110,42,105,44,110,31,110,58,110,8,19,110,79,54,45,55,54,105,99,27,42,105,2,109,49,48,121,110,105,63,34,110,112,154,38,19,44,38,105,43,100,6,105,33,7,2,100,26,44,110,105,55,155,45,112,177,110,110,40,45,45,4,99,108,110,49,116,45,29,100,110,110,110,105,105,32,44,39,0,100,110,110,105,99,38,115,34,73,45,42,105,22,11,107,27,105,105,45,32,100,110,73,100,114,44,34,33,110,109,121,6,17,99,44,40,34,34,105,33,54,73,110,105,37,110,48,31,110,17,33,105,38,105,37,42,110,37,7,100,39,73,105,1,73,110,38,105,33,34,37,110,29,210,37,34,45,73,105,45,55,73,26,61,45,58,110,49,31,105,61,44,34,44,110,32,17,33,42,114,33,73,105,105,110,38,110,116,110,48,78,58,105,110,45,99,49,105,29,55,105,105,40,26,10,15,37,25,37,37,20,16,49,110,84,37,5,100,47,105,11,44,105,110,99,105,33,126,99,2,55,110,204,73,45,55,107,108,105,33,46,73,42,54,116,29,45,188,73,2,54,7,100,39,110,10,49,54,30,33,38,73,43,49,100,110,110,17,19,105,110,97,33,38,100,105,110,43,6,105,43,110,105,73,110,16,99,48,38,100,56,105,48,121,97,55,110,99,105,51,55,110,37,105,24,110,110,110,37,49,73,44,105,109,55,110,49,19,6,42,48,105,105,110,42,110,110,105,49,107,42,105,58,38,97,105,15,107,110,26,60,99,110,110,113,32,1,22,110,105,55,54,49,110,34,2,24,47,17,7,110,126,105,58,99,105,105,155,110,105,105,34,99,105,73,105,42,110,105,33,55,45,45,29,187,105,38,105,53,110,44,109,109,100,73,105,105,110,26,110,100,55,43,48,37,100,54,105,108,43,110,110,39,11,43,99,104,105,105,105,100,105,105,45,33,42,37,110,49,110,105,78,33,73,38,48,54,42,110,29,44,110,105,110,105,110,45,42,39,52,17,16,108,38,54,42,43,110,37,48,99,114,54,39,32,107,100,43,25,43,110,29,100,99,105,54,39,39,110,105,110,33,107,73,29,126,110,101,105,105,44,100,45,110,31,73,54,73,14,109,55,42,44,105,110,105,105,49,48,26,119,110,105,52,105,110,110,105,76,48,99,102,45,110,26,99,105,43,110,43,54,52,32,38,108,45,110,32,110,110,121,105,110,100,44,121,73,48,66,105,99,100,38,32,100,55,107,45,45,78,105,42,105,112,32,105,43,26,31,37,105,37,31,110,33,105,105,110,37,73,110,105,54,105,105,116,110,110,55,42,119,78,99,33,110,37,26,112,51,0,96,33,110,105,30,55,26,109,42,38,43,110,110,24,43,19,78,45,39,105,33,105,99,73,110,73,35,43,41,105,2,105,12,110,40,110,34,33,53,73,119,55,52,73,44,45,110,105,44,55,40,1,110,45,38,39,73,43,105,36,229,44,44,42,108,55,37,105,113,24,22,55,44,73,105,38,105,23,33,105,73,47,94,1,181,110,53,110,105,115,110,32,105,106,105,45,110,43,43,48,73,47,48,105,110,110,110,73,32,5,42,29,43,73,100,38,29,100,32,48,39,32,45,110,52,105,100,33,49,45,54,33,48,53,105,105,29,110,42,8,105,110,117,32,42,24,33,105,99,26,54,117,110,121,48,105,99,110,203,109,42,105,38,19,99,31,31,112,43,78,19,45,45,110,32,17,105,32,227,105,6,53,105,42,51,106,97,38,43,49,24,11,42,110,31,53,33,40,77,110,34,110,43,28,54,105,110,105,115,110,110,110,105,73,31,118,97,112,49,105,105,105,42,105,100,112,100,73,113,34,126,32,45,42,222,110,105,111,99,33,110,73,110,110,48,110,110,117,33,110,105,73,105,7,110,48,99,101,105,43,110,100,26,33,45,110,4,43,55,33,105,105,110,34,105,43,30,37,105,105,39,25,112,48,100,7,45,22,73,73,110,99,43,118,105,48,38,33,38,55,102,42,105,55,30,99,29,40,119,12,105,52,11,110,110,42,110,110,105,73,100,105,105,55,110,105,20,119,44,105,100,110,3,37,52,55,105,105,0,8,110,105,43,73,110,4,117,73,105,105,110,54,105,221,110,110,110,100,49,100,108,30,73,110,105,166,110,110,105,16,29,22,32,105,110,105,105,110,105,1,26,45,105,48,34,105,110,34,42,48,29,47,110,40,39,99,105,53,121,44,100,32,48,54,14,47,73,54,37,105,43,110,105,32,105,37,110,105,33,44,105,55,39,78,45,105,17,23,33,99,121,43,73,105,99,105,33,108,110,33,13,51,41,110,38,100,218,105,45,54,25,45,105,105,110,73,153,48,0,55,49,110,38,40,45,43,100,110,42,52,99,29,110,73,37,26,73,110,43,110,105,73,48,105,149,26,110,126,100,40,110,100,26,110,42,198,105,73,37,49,110,37,110,110,43,110,40,48,61,29,48,100,99,110,110,32,119,47,100,52,73,109,48,99,105,105,115,99,105,48,55,133,73,105,100,24,115,73,42,110,29,121,45,105,56,246,34,43,99,46,35,4,42,29,55,73,43,100,110,121,29,9,105,110,73,34,100,30,110,110,105,25,22,35,58,7,38,105,32,43,52,48,105,105,26,110,19,110,48,34,42,110,113,102,73,105,110,4,110,73,43,24,105,105,43,73,43,45,48,50,105,118,110,42,105,73,33,26,38,110,101,29,105,118,105,45,31,121,105,110,25,105,78,110,49,110,100,97,73,49,105,49,44,29,164,43,105,54,43,32,33,99,147,54,55,110,36,47,110,45,99,110,29,43,45,99,37,110,110,39,119,99,34,99,8,30,34,110,99,20,37,105,99,121,100,16,116,112,45,73,17,55,99,99,105,105,119,110,110,73,78,241,110,99,49,105,29,48,105,105,126,42,73,105,110,110,73,109,120,105,42,38,100,23,100,37,33,19,12,29,41,33,78,112,19,105,144,97,99,110,73,47,99,105,107,105,20,10,43,105,108,38,110,116,55,105,110,38,26,42,110,109,110,170,105,32,39,110,110,105,42,119,32,100,105,105,44,48,100,31,47,110,110,110,54,73,73,19,115,0,73,44,48,121,20,110,105,29,110,99,33,48,105,173,73,110,45,20,105,114,73,110,100,44,26,15,48,29,13,29,4,105,105,105,44,99,105,7,73,26,110,45,43,20,109,110,73,110,100,110,15,100,105,45,105,110,49,99,33,78,150,110,110,38,33,23,99,16,105,110,105,3,105,23,34,50,105,99,32,110,105,73,100,43,26,100,110,33,33,105,100,105,34,0,108,105,110,105,110,38,45,99,53,58,105,48,105,55,73,110,45,100,176,105,114,45,105,105,25,51,45,19,55,37,110,112,105,33,110,43,42,33,25,55,105,105,105,105,48,105,78,16,9,100,110,121,43,17,40,121,73,19,43,45,100,78,101,37,42,105,39,45,16,20,114,25,107,49,105,110,17,102,110,116,95,20,105,19,45,200,32,100,45,26,110,15,99,110,105,5,113,73,100,42,30,43,42,119,29,44,17,45,105,38,38,110,38,99,49,1,49,110,73,7,110,110,43,105,37,47,110,33,73,105,29,45,110,196,110,110,105,110,99,110,118,100,110,47,105,110,73,73,110,73,45,105,110,105,45,32,33,78,73,105,110,37,33,110,38,110,42,110,110,97,33,100,106,110,105,102,73,110,117,16,99,73,73,73,55,99,110,111,55,26,110,105,42,48,17,38,110,105,110,112,105,108,105,110,173,42,110,38,105,105,42,108,105,97,46,105,48,99,97,40,8,34,118,0,119,110,39,78,110,40,110,45,44,105,110,110,105,55,110,99,73,110,105,105,40,44,11,48,73,105,55,43,45,39,148,55,105,105,17,42,48,121,54,121,105,97,105,31,105,110,105,121,16,105,43,40,45,26,110,7,110,49,105,105,22,110,105,73,42,49,33,33,99,110,110,52,45,23,49,109,55,110,110,32,99,105,100,73,100,48,105,42,42,45,105,37,48,110,55,10,55,55,110,105,54,38,37,54,7,48,26,48,105,105,42,73,193,110,54,73,100,78,33,45,99,105,33,110,34,110,25,29,55,48,110,110,99,73,100,110,105,110,49,17,45,110,28,43,68,47,110,49,45,44,24,32,105,34,105,48,110,34,38,110,45,54,108,110,32,105,110,42,110,34,48,105,16,73,110,105,55,99,73,38,52,22,25,34,99,40,33,99,105,33,99,49,100,105,105,105,101,48,117,105,73,100,48,102,4,105,40,105,19,42,37,110,24,114,105,42,110,38,38,43,42,110,110,110,32,44,126,48,254,38,97,110,78,11,105,119,110,105,12,34,30,110,110,104,105,48,38,45,31,110,47,114,100,99,73,203,49,6,100,48,110,48,55,37,35,110,110,34,42,73,2,201,24,40,38,110,105,42,45,108,43,23,38,55,54,105,54,110,45,49,105,44,45,39,31,126,17,38,110,19,38,100,37,55,105,116,45,73,105,42,6,73,55,7,110,110,108,42,110,110,43,105,110,42,16,110,110,105,54,31,38,33,48,105,105,43,4,105,105,105,1,38,58,44,110,110,46,45,52,31,49,100,110,42,32,55,110,42,54,105,73,8,39,11,105,29,48,110,105,104,40,73,42,110,48,99,110,42,39,39,110,110,47,44,43,45,105,43,73,100,50,99,112,38,33,43,30,105,38,105,105,105,46,108,37,126,48,55,52,105,51,45,1,32,49,48,97,16,55,110,110,100,37,54,105,48,1,43,105,33,109,110,17,105,43,110,44,110,49,38,5,22,105,105,99,105,73,110,33,159,114,100,105,112,16,99,141,110,110,40,44,105,31,105,99,105,99,33,180,14,22,107,110,105,17,48,100,161,117,11,73,105,99,48,5,105,105,105,105,73,48,105,25,38,105,51,114,45,105,110,26,37,47,42,110,105,105,42,11,48,100,105,110,34,33,110,45,43,114,48,25,73,38,32,34,105,37,105,110,26,44,22,110,37,73,100,33,55,42,42,0,100,25,110,29,110,110,47,105,110,110,110,34,48,99,100,26,99,110,110,110,19,33,43,52,105,48,110,110,45,44,6,39,44,33,100,11,105,110,110,48,110,110,119,99,110,99,73,58,110,105,110,22,33,106,22,54,43,133,11,105,39,45,52,102,105,10,45,105,53,100,105,88,26,73,110,110,105,105,44,45,110,110,42,44,29,100,109,39,34,43,29,31,55,105,78,48,45,105,110,110,105,61,73,110,73,110,22,99,29,54,105,26,47,39,7,112,110,38,44,4,73,105,105,100,73,105,110,105,15,48,105,105,110,110,45,10,43,106,42,20,117,30,6,42,110,110,105,45,47,110,73,105,126,0,33,54,110,105,110,99,110,43,48,24,38,34,119,19,48,43,110,105,105,105,55,52,29,43,112,39,43,110,73,45,55,110,110,16,195,54,29,44,44,13,34,25,105,32,105,7,73,100,44,105,45,100,73,110,73,37,190,105,32,107,45,43,99,45,29,73,100,31,41,19,20,118,37,99,99,48,105,54,33,105,110,110,110,110,110,99,11,17,105,26,105,42,45,99,45,55,126,55,17,105,45,105,73,99,105,33,33,110,110,112,110,105,38,45,100,44,110,105,110,34,42,47,29,105,42,23,37,33,105,105,55,24,105,105,110,110,73,55,99,105,119,44,110,242,49,34,8,78,1,17,55,105,42,126,16,105,37,5,110,110,97,73,78,105,38,22,105,49,38,100,30,105,33,100,12,105,99,105,73,45,45,110,126,29,105,105,38,45,226,105,45,32,33,41,110,105,117,110,25,105,110,49,101,236,105,45,110,32,105,17,39,121,7,17,26,106,45,48,42,105,32,110,32,45,110,32,105,110,36,105,110,38,110,105,52,34,37,51,117,26,105,17,25,106,105,105,199,48,38,38,37,42,39,100,45,110,114,33,73,110,7,42,110,99,39,29,99,110,42,73,99,55,73,51,105,110,114,110,100,110,99,44,38,193,105,43,48,29,33,100,20,33,49,58,100,39,40,99,32,110,110,39,105,54,99,45,3,126,26,29,32,105,37,48,119,109,110,50,73,105,105,37,105,105,48,100,110,105,110,100,121,184,44,99,105,99,110,105,106,100,99,37,73,105,100,44,106,105,110,104,105,100,17,17,12,33,44,48,40,73,105,45,22,110,105,99,110,105,110,105,55,44,110,23,110,43,45,105,100,44,118,48,110,144,105,54,55,100,110,105,100,55,55,78,32,47,33,110,42,109,54,24,110,110,73,44,105,105,73,105,110,110,29,105,45,26,73,110,20,20,40,105,105,44,100,110,43,105,110,105,51,105,30,37,73,110,110,38,1,22,118,32,110,112,58,40,52,17,108,105,105,41,110,38,105,110,42,110,245,54,105,110,43,43,17,110},key))if a then a()else print("WRONG PASSWORD!")end