Config = {}


--========================================================--
--                    FRAMEWORK SETTINGS                  --
--========================================================--

-- Core resource name | اسم Resource الكور
Config.CoreName = 'qb-core'

-- Target resource name | اسم Resource التارقت
Config.TargetName = 'qb-target'

--========================================================--
--                     ITEM SETTINGS                      --
--========================================================--

-- Item required to revive a player | الايتم المطلوب لإنعاش اللاعب
Config.ItemName = 'medkit'

-- Remove the item after a successful revive
-- true  = remove item
-- false = keep item
-- إزالة الايتم بعد نجاح الإنعاش
Config.RemoveItem = false

--========================================================--
--                    REVIVE SETTINGS                     --
--========================================================--

-- Revive duration in milliseconds
-- 1000 = 1 second
-- 5000 = 5 seconds
-- 8000 = 8 seconds
-- مدة الإنعاش بالمللي ثانية
Config.ReviveTime = 8000

-- Revive chance system
-- true  = enable
-- false = disable
-- نظام الإنعاش بالاحتمال
Config.ReviveChanceSystem = false
-- Revive chance | 50%
-- معدل الإنعاش
Config.ReviveChance = 50

-- Health after revive
-- 'half' -- half health | نصف الصحة
-- 'full' -- full health | الصحة الكاملة
-- مستوى الصحة الذي سيتم الإنعاش عليه
Config.Health = 'half'

-- Revive event used by your ambulance/death resource
-- Usually found in ambulance resources
-- غالباً يوجد في سكربتات الإسعاف
Config.ReviveEvent = 'hospital:client:Revive'

-- Death animations that will be treated as unconscious/dead.
-- Add your ambulance/death script animations here if needed.
-- انميشنات الموت والإغماء.
-- ويمكن إنعاشه باستخدام حقيبة الإسعافات الأولية.
-- أضف انميشنات سكربت الإسعاف الخاص بك هنا عند الحاجة.
Config.DeathAnims = {
    { dict = 'dead', anim = 'dead_a' },
    { dict = 'dead', anim = 'dead_b' },
    { dict = 'dead', anim = 'dead_c' },
    { dict = 'dead', anim = 'dead_d' },
    { dict = 'combat@damage@writhe', anim = 'writhe_loop' },
    { dict = 'anim@gangops@morgue@table@', anim = 'dead' },
    { dict = 'mini@cpr@char_b@cpr_def', anim = 'cpr_pumpchest_idle' },
    { dict = 'mini@cpr@char_b@cpr_def', anim = 'cpr_pumpchest' },
}

--========================================================--
--         MINIGAME SETTINGS (ONLY FOR VGX-MiniGame)      --
--========================================================--

-- Minigame color
-- Color of the minigame UI
-- لون الواجهة الرئيسية للمهمة 
Config.MinigameColor = '#38485C'

-- Minigame arrows per round
-- 5 = 5 arrows
-- 10 = 10 arrows
-- 15 = 15 arrows
-- معدل الأسهم في كل دورة
Config.MinigameArrowsPerRound = 5

-- Minigame rounds
-- 3 = 3 rounds
-- 5 = 5 rounds
-- 10 = 10 rounds
-- معدل الدورات في المهمة 
Config.MinigameRounds = 3

-- Minigame time
-- 12 = 12 seconds
-- 15 = 15 seconds
-- 20 = 20 seconds
-- مدة كل دورة في المهمة 
Config.MinigameTime = 12

--========================================================--
--                     NOTIFICATIONS                      --
--========================================================--

-- Notification messages
-- رسائل الإشعارات
Config.Notify = {
    progressbar = 'Reviving player...',
    no_item = 'You need a %s.',
    no_dead_player = 'This player is not unconscious.',
    failed = 'Revive failed.',
    revived = 'Player revived successfully.',
    being_revived = 'You are being revived.'
}
