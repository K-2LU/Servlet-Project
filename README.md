# Servlet-Project

#include <bits/stdc++.h>
using namespace std;
#define sz 100000
    int longestConsecutive(vector<int>& nums) {
        bool present[2*sz+5] = {false};

        for(auto i: nums)
            present[i+sz] = true;

        int temp[2*sz+5] = {0};

        if(present[0] == true)  temp[0] = 1;
        for(int i = 1; i<=2*sz+1; i++)
            if(present[i] == true)
                temp[i] = temp[i-1]+1;
        
        int ans = -1;
        for(int i = 0; i <= sz; i++)
            ans = max(temp[i], ans);

        return ans;
    }

int main()  {
    vector<int> test = {1,2,3,5,7};

    int ans = longestConsecutive(test);
    cout << ans << endl;
}
