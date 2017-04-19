import pandas as pd

col_names = ['id', 'only_spanish', 'combined_family_income', \
             'household_size', 'household_type', \
             'own_business', 'state', 'age', 'marital', 'gender', 'military', \
             'citizenship', 'employed', 'disability', 'want_job', 'num_job', \
             'work_over35', 'hours_takeoff', 'over_work', 'work_hrs', \
             'len_layoff', 'unemployed_look_len', 'hourly_rate', \
             'num_paid_weeks', 'hrs_all_jobs', 'hrs_mainjob', 'hrs_otherjob',
             'duration_umployment', 'num_paidweeks'] 
col_spaces = [(0, 14), (26, 28), (38, 40), (58, 60), (60, 62), (78, 80), \
              (92, 94), (121, 123), (124, 126), (128, 130), (130, 132), \
              (171, 173), (179, 181), (197, 199), (199, 201), (215, 217), \
              (221, 223), (236, 238), (240, 242), (242,244), (282, 285), \
              (406, 409), (507, 511), (558, 560), (246, 249), (217, 219), \
              (219, 221), (406, 409), (558, 560)]

col_dic = {}
for x, y in zip(col_names, col_spaces):
    col_dic[x] = y

cps = pd.read_fwf('jan16pub.dat', colspecs = col_spaces, \
                  header = None, names = col_names)


# variable1: hrs_takeoff
cps.hours_takeoff.abs().describe()

# variable2: hrs_overwork

# for hrs_mainjob and hrs_otherjob
# delete -4 and take abs value of the column for each observation
hispanic_factor = pd.read_fwf('jan16pub.dat', \
                        colspecs = [(26, 28), (217, 219), (219, 221), \
                                    (406, 409), (236, 238), (240, 242), \
                                    (121, 123), (128, 130)],
                        header = None, \
                        names = ['hispanic', 'hrs_mainjob', 'hrs_otherjob', \
                                 'hrs_alljob', 'hrs_takeoff', 'hrs_overwork', \
                                 'age', 'gender'])
hispanic_factor.to_csv('factor.csv')
        
#{
# 'age' (121, 123)
# 'citizenship': (171, 173),
# 'combined_family_income': (38, 40),
# 'disability': (197, 199),
# 'employed': (179, 181),
# 'gender': (128, 130),
# 'hourly_rate': (507, 511),
# 'hours_takeoff': (236, 238),
# 'household_size': (58, 60),
# 'household_type': (60, 62),
# 'hrs_all_jobs': (246, 249),
# 'hrs_mainjob': (217, 219),
# 'hrs_otherjob': (219, 221),
# 'id': (0, 14),
# 'len_layoff': (282, 285),
# 'marital': (124, 126),
# 'military': (130, 132),
# 'num_job': (215, 217),
# 'num_paid_weeks ': (558, 560),
# 'only_spanish': (26, 28),
# 'over_work': (240, 242),
# 'own_business': (78, 80),
# 'state': (92, 94),
# 'unemployed_look_len': (406, 409),
# 'want_job': (199, 201),
# 'work_hrs': (242, 244),
# 'work_over35': (221, 223)
#}
